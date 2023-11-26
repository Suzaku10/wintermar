import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:wintermar/infrastructure/core/database_module/database_module.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();

  @lazySingleton
  Uuid get uuid => const Uuid();

  @lazySingleton
  MyDatabase get db => MyDatabase();
}