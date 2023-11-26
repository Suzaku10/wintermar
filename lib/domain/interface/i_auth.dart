abstract interface class IAuth {
  Future<bool> doLogin();

  Future<bool> doLogout();

  Future<bool> doRegister();

  Future<bool> doOTP();

  Future<bool> saveCredential();

  Future<bool> removeCredential();
}