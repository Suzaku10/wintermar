import 'package:flutter/material.dart';
import 'package:wintermar/domain/constant/app_sizes.dart';
import 'package:wintermar/domain/constant/app_text_styles.dart';

class AppTextField {
  static Widget defaults({
    TextEditingController? controller,
    String? label,
    String? hint,
    bool obscure = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? secondaryLabel,
    required String? Function(String? value) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(label, style: AppStyles.textMd.primary.bold)),
                if (secondaryLabel != null) secondaryLabel,
              ],
            ),
          ),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          style: AppStyles.textSm.bold.primary,
          validator: validator,
          decoration: InputDecoration(
            errorMaxLines: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            hintText: hint,
            hintStyle: AppStyles.textSm,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              gapPadding: 2,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconConstraints: BoxConstraints(maxHeight: defaultSizeIcon),
            prefixIconConstraints: BoxConstraints(maxHeight: defaultSizeIcon),
          ),
        )
      ],
    );
  }
}