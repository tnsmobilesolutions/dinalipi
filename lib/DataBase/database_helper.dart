import 'package:dinalipi/data/model/dinacharya_Model.dart';
import 'package:dinalipi/data/model/dinalipi_Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._init();
  static sql.Database? _database;
  DataBaseHelper._init();

  Future<sql.Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Dinalipi.db');
    return _database!;
  }

  Future<sql.Database> _initDB(String filePath) async {
    final dbPath = await sql.getDatabasesPath();
    final path = join(dbPath, filePath);

    return await sql.openDatabase(path, version: 1, onCreate: _createDB);
  }

  //create database table
  Future _createDB(sql.Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $dinacharjyaTable (
      ${DinacharjyaFields.id} $idType,
      ${DinacharjyaFields.tasks} $textType,
      ${DinacharjyaFields.taskName} $textType,
      ${DinacharjyaFields.taskStartTime} $textType,
      ${DinacharjyaFields.taskEndTime} $textType,
      ${DinacharjyaFields.taskType} $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE $dinalipiTable (
      ${DinalipiFields.id} $idType,
      ${DinalipiFields.tasks} $textType,
      ${DinalipiFields.taskName} $textType,
      ${DinalipiFields.taskStartTime} $textType,
      ${DinalipiFields.taskEndTime} $textType,
      ${DinalipiFields.taskType} $textType,
      ${DinalipiFields.date} $textType
      )
    ''');
  }

  //insert a Dinacharjya file in database
  Future<Dinacharjya> createDinacharjya(Dinacharjya dinacharjya) async {
    final db = await instance.database;
    final data = {
      'id': dinacharjya.id as String,
      'taskName': dinacharjya.taskName,
      'taskType': dinacharjya.taskType,
      'taskStartTime': dinacharjya.taskStartTime?.toIso8601String() as String,
      'taskEndTime': dinacharjya.taskEndTime?.toIso8601String() as String
    };
    final id = await db.insert(dinacharjyaTable, dinacharjya.toJson());

    // final id = await db.insert(
    //   dinacharjyaTable,
    //   data,
    //   conflictAlgorithm: sql.ConflictAlgorithm.replace,
    // );

    return dinacharjya.copy(
      id: id.toString(),
      taskName: dinacharjya.taskName,
    );
  }

  // read a single Dinacharjya file
  Future<Dinacharjya> readDinacharjya(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      dinacharjyaTable,
      columns: DinacharjyaFields.values,
      where: '${DinacharjyaFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Dinacharjya.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  //read multiple Dinacharjya files
  Future<List<Dinacharjya>> readAllDinacharjya() async {
    final db = await instance.database;
    final result = await db.query(dinacharjyaTable);

    return result.map(((json) => Dinacharjya.fromJson(json))).toList();
  }

  //update a Dinacharjya file
  Future<int> updateDinacharjya(Dinacharjya task) async {
    final db = await instance.database;

    return db.update(
      dinacharjyaTable,
      task.toJson() as Map<String, Object>,
      where: '${DinacharjyaFields.id} = ?',
      whereArgs: [task.id],
    );
  }

  //delete a Dinacharjya file
  Future<int> deleteDinacharjya(int id) async {
    final db = await instance.database;

    return db.delete(
      dinacharjyaTable,
      where: '${DinacharjyaFields.id} = ?',
      whereArgs: [id],
    );
  }

  //insert a Dinalipi file in database
  Future<Dinalipi> createDinalipi(Dinalipi dinalipi) async {
    final db = await instance.database;
    final id = await db.insert(dinalipiTable, dinalipi.toJson());

    return dinalipi.copy(
      id: id.toString(),
      taskName: dinalipi.taskName,
    );
  }

  // read a single Dinalipi file
  Future<Dinalipi> readDinalipi(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      dinalipiTable,
      columns: DinalipiFields.values,
      where: '${DinalipiFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Dinalipi.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  //read multiple Dinalipi files
  Future<List<Dinalipi>> readAllDinalipi() async {
    final db = await instance.database;
    final result = await db.query(dinalipiTable);

    return result.map(((json) => Dinalipi.fromJson(json))).toList();
  }

  //update a Dinalipi file
  Future<int> updateDinalipi(Dinalipi task) async {
    final db = await instance.database;

    return db.update(
      dinalipiTable,
      task.toJson(),
      where: '${DinalipiFields.id} = ?',
      whereArgs: [task.id],
    );
  }

  //delete a Dinalipi file
  Future<int> deleteDinalipi(int id) async {
    final db = await instance.database;

    return db.delete(
      dinalipiTable,
      where: '${DinalipiFields.id} = ?',
      whereArgs: [id],
    );
  }

  //close database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
