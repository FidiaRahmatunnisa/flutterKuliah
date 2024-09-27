import 'package:mysql1/mysql1.dart';

class DBConnection {
  static final DBConnection _instance = DBConnection._internal();
  late MySqlConnection _connection;

  factory DBConnection() {
    return _instance;
  }

  DBConnection._internal();

  Future<void> openConnection() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'yoloiss_db',
    );
    _connection = await MySqlConnection.connect(settings);
  }

  Future<void> closeConnection() async {
    await _connection.close();
  }

  MySqlConnection get connection => _connection;
}
