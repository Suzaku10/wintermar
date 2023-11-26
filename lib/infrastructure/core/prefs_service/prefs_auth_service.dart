import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wintermar/domain/constant/app_strings.dart';
import 'package:wintermar/domain/interface/i_prefs_auth_service.dart';
import 'package:wintermar/infrastructure/core/database_module/database_module.dart';

@LazySingleton(as: IPrefsAuthService)
class PrefsService implements IPrefsAuthService {
  final SharedPreferences _preferences;

  PrefsService(this._preferences);

  @override
  bool isLoggedIn() => _preferences.getBool(AppStrings.isLoginPrefs) ?? false;

  @override
  Future<void> saveLoggedInStatus(bool isLoggedIn) async => await _preferences.setBool(AppStrings.isLoginPrefs, isLoggedIn);

  @override
  Future<void> saveCredential(User? user) async => await _preferences.setString(AppStrings.userCredentialPrefs, jsonEncode(user?.toJson()));

  @override
  Future<void> removeCredential() async => await _preferences.remove(AppStrings.userCredentialPrefs);

  @override
  String username() {
    try {
      final user = User.fromJson(jsonDecode(_preferences.getString(AppStrings.userCredentialPrefs)!));
      return user.username ?? '';
    } catch(e) {
      return '';
    }
  }
}
