// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "greetings": MessageLookupByLibrary.simpleMessage("Hei,"),
        "have_account":
            MessageLookupByLibrary.simpleMessage("Already have account?"),
        "hint_confirm_password":
            MessageLookupByLibrary.simpleMessage("Retype Password"),
        "hint_email":
            MessageLookupByLibrary.simpleMessage("jhon.doe@example.com"),
        "hint_password": MessageLookupByLibrary.simpleMessage("Input Password"),
        "hint_phone_number":
            MessageLookupByLibrary.simpleMessage("08123456789"),
        "hint_username": MessageLookupByLibrary.simpleMessage("Input Username"),
        "login_now": MessageLookupByLibrary.simpleMessage("Login Now"),
        "no_account":
            MessageLookupByLibrary.simpleMessage("Didn\'t have account?"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "phone_number": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "register_info": MessageLookupByLibrary.simpleMessage(
            "Please Login/Register to Continue"),
        "register_now": MessageLookupByLibrary.simpleMessage("Register Now"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "validator_confirm_password_empty":
            MessageLookupByLibrary.simpleMessage(
                "Password Confirmation cannot be empty"),
        "validator_confirm_password_not_match":
            MessageLookupByLibrary.simpleMessage(
                "Password Confirmation didn\'t match"),
        "validator_email_empty":
            MessageLookupByLibrary.simpleMessage("Email cannot be empty"),
        "validator_email_invalid":
            MessageLookupByLibrary.simpleMessage("Email not valid"),
        "validator_name_empty":
            MessageLookupByLibrary.simpleMessage("Username cannot be empty"),
        "validator_name_limit": MessageLookupByLibrary.simpleMessage(
            "Username must be 3 character or max 50 character"),
        "validator_password_empty":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "validator_password_invalid": MessageLookupByLibrary.simpleMessage(
            "Password must contains number, symbol, lowercase character, and uppercase character"),
        "validator_password_limit": MessageLookupByLibrary.simpleMessage(
            "Password must be more than 8 character"),
        "validator_phone_number_empty": MessageLookupByLibrary.simpleMessage(
            "Phone Number cannot be empty"),
        "validator_phone_number_invalid":
            MessageLookupByLibrary.simpleMessage("Phone Number not valid"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
