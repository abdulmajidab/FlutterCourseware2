import 'package:registration_app/Register.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath(); //TEXT NOT NULL
    return openDatabase(
      join(path, 'Registration.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE register(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,date TEXT NOT NULL, email TEXT NOT NULL,unique(email))",
        );
      },
      version: 1,
    );
  }

  //CRUD Operation of Attendance

  Future<int> insertRegister(List<Register> attendances) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var attendance in attendances) {
      result = await db.insert('register', attendance.toMap());
    }
    return result;
  }

  Future<List<Register>> retrieveRegister() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('register');
    return queryResult.map((e) => Register.fromMap(e)).toList();
  }

  Future<void> deleteRegister(int id) async {
    final db = await initializeDB();
    await db.delete(
      'register',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
