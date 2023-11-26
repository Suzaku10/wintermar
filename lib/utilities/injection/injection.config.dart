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
import 'package:shared_preferences/shared_preferences.dart' as _i4;
import 'package:uuid/uuid.dart' as _i5;

import '../../domain/interface/i_prefs_auth_service.dart' as _i6;
import '../../infrastructure/core/database_module/database_module.dart' as _i3;
import '../../infrastructure/core/prefs_service/prefs_auth_service.dart' as _i7;
import '../../infrastructure/core/register_module.dart' as _i10;
import '../router/app_route_guard.dart' as _i8;
import '../router/app_router.dart' as _i9;

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
    gh.lazySingleton<_i3.MyDatabase>(() => registerModule.db);
    await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i6.IPrefsAuthService>(
        () => _i7.PrefsService(gh<_i4.SharedPreferences>()));
    gh.lazySingleton<_i8.AppRouteGuard>(
        () => _i8.AppRouteGuard(gh<_i6.IPrefsAuthService>()));
    gh.lazySingleton<_i9.AppRouter>(
        () => _i9.AppRouter(gh<_i8.AppRouteGuard>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
