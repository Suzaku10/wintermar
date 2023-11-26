import 'package:flutter/material.dart';
import 'package:wintermar/domain/constant/app_colors.dart';

extension TextColor on TextStyle {
  TextStyle get primary {
    return copyWith(color: AppColors.primary);
  }

  TextStyle get white {
    return copyWith(color: AppColors.white);
  }

  TextStyle get semiBold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w800);
  }
}
