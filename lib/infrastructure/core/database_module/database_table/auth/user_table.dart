import 'package:drift/drift.dart';
import 'package:wintermar/utilities/utilities.dart';

class Users extends Table {
  TextColumn get id => text().unique().clientDefault(() => generateId())();

  TextColumn get email => text().nullable()();

  TextColumn get password => text().nullable()();

  TextColumn get username => text().nullable()();

  TextColumn get phoneNumber => text().named('phone_number').nullable()();

  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}
