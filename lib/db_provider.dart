import 'dart:async';
import 'dart:io';

import 'package:effective_mobile_flutter_task/client.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "AppDB.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Client ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "first_name TEXT,"
              "last_name TEXT,"
              "email TEXT,"
              "password TEXT"
              ")");
        });
  }

  newClient(Client client) async {
    final db = await database;

    var raw = await db.rawInsert(
        "INSERT INTO Client (first_name, last_name, email, password)"
            "VALUES (?,?,?,?)",
    [client.firstName, client.lastName, client.email, client.password]);
    return raw;
  }

  getClient(int id) async {
    final db = await database;

    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first): null;
  }

  existClient(Client client) async {
    final db = await database;

    var res = await db.query(
        "Client",
        where: "first_name = ? AND password = ?",
        whereArgs: [client.firstName, client.password]);

    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  getAllClients() async {
    final db = await database;

    var res = await db.query("Client");

    List<Client> clients = res.isNotEmpty ? res.map((client) => Client.fromMap(client)).toList() : [];
    return clients;
  }

}

