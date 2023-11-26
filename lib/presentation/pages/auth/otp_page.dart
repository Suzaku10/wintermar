import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wintermar/application/auth_store.dart';
import 'package:wintermar/domain/constant/app_enum.dart';
import 'package:wintermar/presentation/components/app_button.dart';
import 'package:wintermar/presentation/pages/auth/components/otp_widgets.dart';
import 'package:wintermar/presentation/pages/auth/components/resend_code_widgets.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';
import 'package:wintermar/utilities/injection/injection.dart';
import 'package:wintermar/utilities/router/app_router.dart';
import 'package:wintermar/utilities/utilities.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final AuthStore _authStore = getIt<AuthStore>();

  final _otpDigit = 6;
  bool _isEnabled = false;
  late String _otpCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Observer(
                    builder: (_) => OTPWidgets(
                      phoneNumber: ' ${_authStore.user.phoneNumber}',
                      otpShape: OTPShape.circle,
                      otpDigit: _otpDigit,
                      callback: _setCallback,
                    ),
                  ),
                  const ResendCodeWidgets(),
                ],
              ),
            ),
          ),
          AppButton.defaults(title: I10n.current.send_otp, onPressed: _isEnabled ? _onSubmitOTP : null)
        ],
      ),
    );
  }

  void _setCallback(String v) {
    _otpCode = v;
    setState(() {
      if (v.length == _otpDigit) {
        _isEnabled = true;
      } else {
        _isEnabled = false;
      }
    });
  }

  void _onSubmitOTP() async {
    try {
      showLoading();
      final response = await _authStore.sendOTP(_otpCode);
      dismissLoading();
      if (response) context.router.replaceAll([const HomeRoute()]);
    } catch (e) {
      showError(e);
    }
  }
}
