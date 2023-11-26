import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:wintermar/domain/interface/i_prefs_auth_service.dart';

import 'app_router.dart';

@lazySingleton
class AppRouteGuard extends AutoRouteGuard {
  final IPrefsAuthService _authService;

  AppRouteGuard(this._authService);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (_authService.isLoggedIn()) {
      resolver.next(true);
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}
