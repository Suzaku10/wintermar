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
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../domain/interface/i_prefs_auth_service.dart' as _i4;
import '../../infrastructure/core/prefs_service/prefs_auth_service.dart' as _i5;
import '../../infrastructure/core/register_module.dart' as _i8;
import '../router/app_route_guard.dart' as _i6;
import '../router/app_router.dart' as _i7;

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
    await gh.lazySingletonAsync<_i3.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.IPrefsAuthService>(
        () => _i5.PrefsService(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i6.AppRouteGuard>(
        () => _i6.AppRouteGuard(gh<_i4.IPrefsAuthService>()));
    gh.lazySingleton<_i7.AppRouter>(
        () => _i7.AppRouter(gh<_i6.AppRouteGuard>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
