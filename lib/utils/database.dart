import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:webandcrafts_employee_app/models/employee_response.dart';

class DBHelper {
  static Database _db;
  static const int DATABASE_VERSION = 1;
  static const String DATABASE_NAME = "EmployeeDatabase.db";
  static const String TABLE_NAME = "EMPLOYEE_TABLE";
  static const String TABLE_COLUMN_ID = "id";
  static const String TABLE_COLUMN_NAME = "name";

  DBHelper._privateConstructor();

  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

//Creating a database with name test.dn in your directory
  Future<Database> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);
    Database theDb = await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _onCreate);
    return theDb;
  }

// Creating a table
  void _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $TABLE_NAME (id INTEGER PRIMARY KEY, name TEXT,username TEXT, email TEXT, profile_image TEXT, address TEXT, lat TEXT, lng TEXT, phone TEXT, website TEXT, company_name TEXT, catchPhrase TEXT, bs TEXT)',
    );
  }

// To get all the values that is inserted in database
  Future<List<Map>> getEmployeeList(String searchKey) async {
    var dbClient = await db;
    List<Map<String, dynamic>> list = await dbClient
        .query(TABLE_NAME, where: "name LIKE ?", whereArgs: ['%$searchKey']);

    print(list);
    return list;
  }

// addText method to inset the values in database.
  Future<String> add(EmployeeData employee) async {
    var dbClient = await db;
    try {
      await dbClient.insert(
        TABLE_NAME,
        {
          "id": employee.id ?? "",
          "name": employee.name ?? "",
          "username": employee.username ?? "",
          "email": employee.email ?? "",
          "profile_image": employee.profileImage ?? "",
          "address": employee.address.street ??
              "" + "," + employee.address.suite ??
              "" + "" + employee.address.suite ??
              "" + " " + employee.address.zipcode ??
              "",
          "lat": employee.address.geo.lat ?? "",
          "lng": employee.address.geo.lng ?? "",
          "phone": employee.phone ?? "",
          "website": employee.website ?? "",
          "company_name":
              employee.company != null && employee.company.name != null
                  ? employee.company.name
                  : "",
          "catchPhrase":
              employee.company != null && employee.company.catchPhrase != null
                  ? employee.company.catchPhrase
                  : "",
          "bs": employee.company != null && employee.company.bs != null
              ? employee.company.bs
              : ""
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print(employee.username);
      print(employee.name);
      print(employee.email);
      print("Error--> $e");
    }
  }

// deleteText to perform delete query.
  deleteEmployee(String employeeId) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE_NAME,
        where: '$TABLE_COLUMN_NAME = ?', whereArgs: [employeeId]);
  }
}
