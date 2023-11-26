import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wintermar/domain/constant/app_colors.dart';
import 'package:wintermar/domain/constant/app_enum.dart';
import 'package:wintermar/domain/constant/app_text_styles.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';

class OTPWidgets extends StatefulWidget {
  final String phoneNumber;
  final int otpDigit;
  final OTPShape otpShape;
  final Color? borderColor;
  final Function(String otp) callback;

  const OTPWidgets({super.key, required this.phoneNumber, this.otpDigit = 6, this.otpShape = OTPShape.box, this.borderColor, required this.callback});

  @override
  State<OTPWidgets> createState() => _OTPWidgetsState();
}

class _OTPWidgetsState extends State<OTPWidgets> {
  late Color _borderColor;
  late List<TextEditingController> controllers;
  late List<Widget> otpWidgets;
  late List<FocusNode?> focusNodes;

  late List<String> _result;

  @override
  void initState() {
    _borderColor = widget.borderColor ?? AppColors.primary;
    controllers = List.generate(widget.otpDigit, (index) => TextEditingController(), growable: false);
    focusNodes = List.generate(widget.otpDigit, (index) => FocusNode(), growable: false);
    otpWidgets = List.generate(widget.otpDigit, (index) => Flexible(child: _otpArea(index)), growable: false);
    focusNodes.firstOrNull?.requestFocus();
    _result = List.generate(widget.otpDigit, (index) => "", growable: false);
    super.initState();
  }

  @override
  void dispose() {
    controllers.map((e) => e.dispose());
    focusNodes.map((e) => e?.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(I10n.current.enter_authentication_code, style: AppStyles.textLg.semiBold),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: I10n.current.otp_info(widget.otpDigit),
            children: [
              TextSpan(text: widget.phoneNumber),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: otpWidgets)
      ],
    );
  }

  Widget _otpArea(int index) {
    return Container(
      decoration: widget.otpShape == OTPShape.circle ? BoxDecoration(shape: BoxShape.circle, border: Border.all(color: _borderColor)) : null,
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (key) => _handleBackSpace(key, index),
        child: TextField(
          controller: controllers[index],
          textAlign: TextAlign.center,
          maxLength: 1,
          focusNode: focusNodes[index],
          keyboardType: TextInputType.number,
          onTap: () => _handleTapOnEmptyFocus(index),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) => _handleOnChange(value, index),
          decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.zero,
            enabledBorder: _border,
            focusedBorder: _border,
            errorBorder: _border,
            border: _border,
          ),
        ),
      ),
    );
  }

  InputBorder? get _border {
    if (widget.otpShape == OTPShape.box) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: _borderColor),
        borderRadius: BorderRadius.circular(10),
      );
    } else if (widget.otpShape == OTPShape.underline) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: _borderColor),
      );
    } else {
      return InputBorder.none;
    }
  }

  void _handleBackSpace(RawKeyEvent key, int index) {
    if (key.isKeyPressed(LogicalKeyboardKey.backspace) || key.isKeyPressed(LogicalKeyboardKey.delete)) {
      if (index != 0) {
        controllers[index - 1].clear();
        focusNodes[index - 1]?.requestFocus();
      }
    }
  }

  void _handleOnChange(String value, int index) {
    if (value.isNotEmpty) {
      _result[index] = value;
      if (index < focusNodes.length - 1) focusNodes[index + 1]?.requestFocus();
    } else {
      _result[index] = value;
      if (index != 0) {
        if (index == focusNodes.length -1) {
          focusNodes[index]?.requestFocus();
        } else {
          focusNodes[index - 1]?.requestFocus();
        }
      }
    }

    final tempResult = _result.toList(growable: true);
    tempResult.removeWhere((element) => element.isEmpty);

    widget.callback(tempResult.join(''));
  }

  void _handleTapOnEmptyFocus(int index) {
    if (_result.every((element) => element.isEmpty)) {
      focusNodes.firstOrNull?.requestFocus();
    } else {
      focusNodes[_result.lastIndexWhere((element) => element.isNotEmpty) + 1]?.requestFocus();
    }
  }
}
