import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:wintermar/domain/constant/app_colors.dart';
import 'package:wintermar/utilities/injection/injection.dart';

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

String generateId() => getIt<Uuid>().v4();

bool isValidEmail(String email) {
  return RegExp(r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      .hasMatch(email);
}
