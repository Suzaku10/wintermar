import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

String remainingTime({required int timeInSecond}) {
  int sec = timeInSecond % 60;
  int min = (timeInSecond / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute:$second";
}

void showLoading() => EasyLoading.show(maskType: EasyLoadingMaskType.black);

void dismissLoading() => EasyLoading.isShow ? EasyLoading.dismiss() : null;

void showError(dynamic e) {
  if (EasyLoading.isShow) dismissLoading();
  EasyLoading.showError(e.toString());
}
