import 'package:flutter/services.dart';
import 'package:wintermar/domain/constant/app_colors.dart';

Future<void> setStatusBarAndOrientation() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primary.withOpacity(0.5),
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}