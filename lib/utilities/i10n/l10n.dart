// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I10n {
  I10n();

  static I10n? _current;

  static I10n get current {
    assert(_current != null,
        'No instance of I10n was loaded. Try to initialize the I10n delegate before accessing I10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I10n();
      I10n._current = instance;

      return instance;
    });
  }

  static I10n of(BuildContext context) {
    final instance = I10n.maybeOf(context);
    assert(instance != null,
        'No instance of I10n present in the widget tree. Did you add I10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I10n? maybeOf(BuildContext context) {
    return Localizations.of<I10n>(context, I10n);
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Input Username`
  String get hint_username {
    return Intl.message(
      'Input Username',
      name: 'hint_username',
      desc: '',
      args: [],
    );
  }

  /// `jhon.doe@example.com`
  String get hint_email {
    return Intl.message(
      'jhon.doe@example.com',
      name: 'hint_email',
      desc: '',
      args: [],
    );
  }

  /// `08123456789`
  String get hint_phone_number {
    return Intl.message(
      '08123456789',
      name: 'hint_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Input Password`
  String get hint_password {
    return Intl.message(
      'Input Password',
      name: 'hint_password',
      desc: '',
      args: [],
    );
  }

  /// `Retype Password`
  String get hint_confirm_password {
    return Intl.message(
      'Retype Password',
      name: 'hint_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get validator_name_empty {
    return Intl.message(
      'Username cannot be empty',
      name: 'validator_name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Username must be 3 character or max 50 character`
  String get validator_name_limit {
    return Intl.message(
      'Username must be 3 character or max 50 character',
      name: 'validator_name_limit',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get validator_email_empty {
    return Intl.message(
      'Email cannot be empty',
      name: 'validator_email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Email not valid`
  String get validator_email_invalid {
    return Intl.message(
      'Email not valid',
      name: 'validator_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number cannot be empty`
  String get validator_phone_number_empty {
    return Intl.message(
      'Phone Number cannot be empty',
      name: 'validator_phone_number_empty',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number not valid`
  String get validator_phone_number_invalid {
    return Intl.message(
      'Phone Number not valid',
      name: 'validator_phone_number_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get validator_password_empty {
    return Intl.message(
      'Password cannot be empty',
      name: 'validator_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be more than 8 character`
  String get validator_password_limit {
    return Intl.message(
      'Password must be more than 8 character',
      name: 'validator_password_limit',
      desc: '',
      args: [],
    );
  }

  /// `Password must contains number, symbol, lowercase character, and uppercase character`
  String get validator_password_invalid {
    return Intl.message(
      'Password must contains number, symbol, lowercase character, and uppercase character',
      name: 'validator_password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation cannot be empty`
  String get validator_confirm_password_empty {
    return Intl.message(
      'Password Confirmation cannot be empty',
      name: 'validator_confirm_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation didn't match`
  String get validator_confirm_password_not_match {
    return Intl.message(
      'Password Confirmation didn\'t match',
      name: 'validator_confirm_password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Please Login/Register to Continue`
  String get register_info {
    return Intl.message(
      'Please Login/Register to Continue',
      name: 'register_info',
      desc: '',
      args: [],
    );
  }

  /// `Didn't have account?`
  String get no_account {
    return Intl.message(
      'Didn\'t have account?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have account?`
  String get have_account {
    return Intl.message(
      'Already have account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get login_now {
    return Intl.message(
      'Login Now',
      name: 'login_now',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get register_now {
    return Intl.message(
      'Register Now',
      name: 'register_now',
      desc: '',
      args: [],
    );
  }

  /// `Hei,`
  String get greetings {
    return Intl.message(
      'Hei,',
      name: 'greetings',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message(
      'Resend Code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter authentication code`
  String get enter_authentication_code {
    return Intl.message(
      'Enter authentication code',
      name: 'enter_authentication_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the {otp_digit}-digit that we have sent via the phone number to`
  String otp_info(int otp_digit) {
    return Intl.message(
      'Enter the $otp_digit-digit that we have sent via the phone number to',
      name: 'otp_info',
      desc: 'OTP Digit info',
      args: [otp_digit],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I10n> load(Locale locale) => I10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
