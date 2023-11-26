abstract interface class IPrefsAuthService {
  bool isLoggedIn();

  Future<void> saveLoggedInStatus(bool isLoggedIn);
}
