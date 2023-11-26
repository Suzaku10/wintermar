import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:wintermar/domain/constant/app_pages.dart';
import 'package:wintermar/utilities/router/app_route_guard.dart';

import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/auth/otp_page.dart';
import '../../presentation/pages/auth/register_page.dart';
import '../../presentation/pages/home/home_page.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final AppRouteGuard _guard;
  AppRouter(this._guard);

  @override
  List<AutoRoute> get routes => [
    // AutoRoute(path: AppPages.registerRoute, page: RegisterRoute.page),
    AutoRoute(path: AppPages.loginRoute, page: LoginRoute.page),
    AutoRoute(path: AppPages.otpRoute, page: OTPRoute.page),
    // AutoRoute(path: AppPages.homeRoute, page: HomeRoute.page, initial: true, guards: [_guard]),
    AutoRoute(path: AppPages.registerRoute, page: RegisterRoute.page, initial: true),
  ];
}