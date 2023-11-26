import 'package:wintermar/infrastructure/core/database_module/database_module.dart';

abstract interface class IPrefsAuthService {
  bool isLoggedIn();

  String username();

  Future<void> saveLoggedInStatus(bool isLoggedIn);

  Future<void> saveCredential(User user);

  Future<void> removeCredential();
}
