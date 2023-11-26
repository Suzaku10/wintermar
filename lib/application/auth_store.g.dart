// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<String>? _$usernameComputed;

  @override
  String get username => (_$usernameComputed ??=
          Computed<String>(() => super.username, name: '_AuthStore.username'))
      .value;

  late final _$userAtom = Atom(name: '_AuthStore.user', context: context);

  @override
  UserRequest get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserRequest value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_AuthStore.register', context: context);

  @override
  Future<bool> register(UserRequest request) {
    return _$registerAsyncAction.run(() => super.register(request));
  }

  late final _$sendOTPAsyncAction =
      AsyncAction('_AuthStore.sendOTP', context: context);

  @override
  Future<bool> sendOTP(String code) {
    return _$sendOTPAsyncAction.run(() => super.sendOTP(code));
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStore.login', context: context);

  @override
  Future<bool> login(UserRequest request) {
    return _$loginAsyncAction.run(() => super.login(request));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
user: ${user},
username: ${username}
    ''';
  }
}
