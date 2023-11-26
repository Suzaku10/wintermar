import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wintermar/domain/constant/app_strings.dart';
import 'package:wintermar/domain/interface/i_prefs_auth_service.dart';

@LazySingleton(as: IPrefsAuthService)
class PrefsService implements IPrefsAuthService {
  final SharedPreferences _preferences;

  PrefsService(this._preferences);

  @override
  bool isLoggedIn() => _preferences.getBool(AppStrings.isLoginPrefs) ?? false;

  @override
  Future<void> saveLoggedInStatus(bool isLoggedIn) async => await _preferences.setBool(AppStrings.isLoginPrefs, isLoggedIn);
}
