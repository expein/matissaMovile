import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE citas(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        servicio TEXT,
        precio DOUBLE,
        fecha DATE,
        hora TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'matissa.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String servicio, double? precio, DateTime fecha, TimeOfDay hora) async {
    final db = await SQLHelper.db();

    final data = {
      'servicio': servicio, 
      'precio': precio, 
      'fecha': fecha.toLocal().toIso8601String().substring(0, 10),
      'hora': '${hora.hour}:${hora.minute}'
    };
    final id = await db.insert('citas', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('citas', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('citas', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
static Future<int> updateItem(int id, String servicio, double? precio,
      DateTime fecha, TimeOfDay hora) async {
    final db = await SQLHelper.db();

    final data = {
      'servicio': servicio,
      'precio': precio,
      'fecha': fecha.toLocal().toIso8601String().substring(0, 10),
      'hora': '${hora.hour}:${hora.minute}',
      'createdAt': DateTime.now().toString(),
    };

    final result =
        await db.update('citas', data, where: "id = ?", whereArgs: [id]);
    return result;
  }


  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("citas", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
