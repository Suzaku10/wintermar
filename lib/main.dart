import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wintermar/domain/constant/app_sizes.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';
import 'package:wintermar/utilities/injection/injection.dart';
import 'package:wintermar/utilities/router/app_router.dart';
import 'package:wintermar/utilities/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await setStatusBarAndOrientation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(AppSizes.appScreenWidth, AppSizes.appScreenHeight),
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            I10n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
          ],
          routerConfig: getIt<AppRouter>().config(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
