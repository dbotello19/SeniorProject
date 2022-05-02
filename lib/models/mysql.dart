import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';

class Mysql {
  static String host = '35.223.98.217',
      user = 'root',
      password = 'dollaire12345',
      db = 'test';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
