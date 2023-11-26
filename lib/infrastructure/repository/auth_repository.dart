import 'package:injectable/injectable.dart';
import 'package:wintermar/domain/interface/i_auth.dart';
import 'package:wintermar/domain/interface/i_prefs_auth_service.dart';
import 'package:wintermar/domain/request/user_request.dart';
import 'package:wintermar/infrastructure/core/database_module/database_helper/user_db_helper.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';

@LazySingleton(as: IAuth)
class AuthRepository implements IAuth {
  final IPrefsAuthService _authPrefs;
  final UserDBHelper _userDB;

  AuthRepository(this._authPrefs, this._userDB);

  @override
  Future<bool> doLogin({required UserRequest request}) async {
    try {
      final response = await _userDB.getCurrentUser(user: request);
      if (response == null) return false;
      await _authPrefs.saveCredential(response);
      await _authPrefs.saveLoggedInStatus(true);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> doLogout() async {
    try {
      await _authPrefs.removeCredential();
      await _authPrefs.saveLoggedInStatus(false);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> doOTP({required String otp, required UserRequest request}) async {
    try {
      if (otp == '111111') {
        final response = await _userDB.getCurrentUser(user: request);
        if (response == null) return false;
        await _authPrefs.saveCredential(response);
        await _authPrefs.saveLoggedInStatus(true);
        return true;
      } else {
        throw Exception(I10n.current.invalid_otp_code);
      }
    } catch (e) {
     rethrow;
    }
  }

  @override
  Future<bool> doRegister({required UserRequest request}) async {
    try {
      final response = await _userDB.insert(user: request);
      return response != -1;
    } catch (e) {
      rethrow;
    }
  }

  @override
  String username() => _authPrefs.username();
}
