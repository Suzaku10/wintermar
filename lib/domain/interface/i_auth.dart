import 'package:wintermar/domain/request/user_request.dart';

abstract interface class IAuth {
  Future<bool> doLogin({required UserRequest request});

  Future<bool> doLogout();

  Future<bool> doRegister({required UserRequest request});

  Future<bool> doOTP({required String otp, required UserRequest request});

  String username();
}