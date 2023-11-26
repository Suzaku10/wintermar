import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:wintermar/domain/interface/i_auth.dart';
import 'package:wintermar/domain/request/user_request.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';

part 'auth_store.g.dart';

@lazySingleton
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final IAuth _authRepository;

  _AuthStore(this._authRepository);

  @observable
  UserRequest user = UserRequest.empty();

  @computed
  String get username => _authRepository.username();

  @action
  Future<bool> register(UserRequest request) async {
    try {
      user = request;
      return await _authRepository.doRegister(request: request);
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<bool> sendOTP(String code) async {
    try {
      final response = await _authRepository.doOTP(otp: code, request: user);
      if (!response) {
        throw Exception(I10n.current.invalid_otp_code);
      } else {
        user = UserRequest.empty();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<bool> login(UserRequest request) async {
    try {
      final response = await _authRepository.doLogin(request: request);
      if (!response) {
        throw Exception(I10n.current.something_error);
      } else {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> logout() async {
    try {
      await _authRepository.doLogout();
    } catch (e) {
      rethrow;
    }
  }
}
