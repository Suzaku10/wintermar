// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../domain/interface/i_prefs_auth_service.dart' as _i4;
import '../../infrastructure/core/register_module.dart' as _i7;
import '../router/app_route_guard.dart' as _i3;
import '../router/app_router.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppRouteGuard>(
        () => _i3.AppRouteGuard(gh<_i4.IPrefsAuthService>()));
    gh.lazySingleton<_i5.AppRouter>(
        () => _i5.AppRouter(gh<_i3.AppRouteGuard>()));
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}