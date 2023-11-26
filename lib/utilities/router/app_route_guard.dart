import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.dart';

@lazySingleton
class AppRouteGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {

  }
}