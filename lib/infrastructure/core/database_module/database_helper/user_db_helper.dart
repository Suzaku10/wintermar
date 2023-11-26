import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:wintermar/domain/request/user_request.dart';
import 'package:wintermar/infrastructure/core/database_module/database_module.dart';
import 'package:wintermar/utilities/i10n/l10n.dart';

@injectable
class UserDBHelper extends Table {
  final MyDatabase _db;

  UserDBHelper(this._db);

  /// Read Section
  Future<List<User>> getUsers({required UserRequest user}) async => await (_db.users.select()..where((tbl) => tbl.username.equals(user.username))).get();

  Future<User?> getCurrentUser({required UserRequest user}) async {
    try {
      final response = await getUsers(user: user);
      final loggedUser = response.firstWhere((element) => element.password == user.password);
      return loggedUser;
    } catch (e) {
      return null;
    }
  }

  /// Create Section
  Future<int> insert({
    required UserRequest user,
  }) async {
    try {
      final duplicate = await getUsers(user: user);
      if (duplicate.isNotEmpty) throw Exception(I10n.current.username_already_exist);
      return await _db.users.insertOne(
        UsersCompanion.insert(
          email: Value(user.email),
          username: Value(user.username),
          password: Value(user.password),
          phoneNumber: Value(user.phoneNumber),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
