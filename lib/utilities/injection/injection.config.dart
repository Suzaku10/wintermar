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
import 'package:uuid/uuid.dart' as _i6;

import '../../application/auth_store.dart' as _i13;
import '../../domain/interface/i_auth.dart' as _i11;
import '../../domain/interface/i_prefs_auth_service.dart' as _i7;
import '../../infrastructure/core/database_module/database_helper/user_db_helper.dart'
    as _i5;
import '../../infrastructure/core/database_module/database_module.dart' as _i3;
import '../../infrastructure/core/prefs_service/prefs_auth_service.dart' as _i8;
import '../../infrastructure/core/register_module.dart' as _i14;
import '../../infrastructure/repository/auth_repository.dart' as _i12;
import '../router/app_route_guard.dart' as _i9;
import '../router/app_router.dart' as _i10;

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
    gh.factory<_i5.UserDBHelper>(() => _i5.UserDBHelper(gh<_i3.MyDatabase>()));
    gh.lazySingleton<_i6.Uuid>(() => registerModule.uuid);
    gh.lazySingleton<_i7.IPrefsAuthService>(
        () => _i8.PrefsService(gh<_i4.SharedPreferences>()));
    gh.lazySingleton<_i9.AppRouteGuard>(
        () => _i9.AppRouteGuard(gh<_i7.IPrefsAuthService>()));
    gh.lazySingleton<_i10.AppRouter>(
        () => _i10.AppRouter(gh<_i9.AppRouteGuard>()));
    gh.lazySingleton<_i11.IAuth>(() => _i12.AuthRepository(
          gh<_i7.IPrefsAuthService>(),
          gh<_i5.UserDBHelper>(),
        ));
    gh.lazySingleton<_i13.AuthStore>(() => _i13.AuthStore(gh<_i11.IAuth>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
