import 'package:expense_app/models/ex_category.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/icons.dart';

class DatabaseProvider with ChangeNotifier {
  // to show the data temporarily use in app memory like thi one here;
  List<ExpenseCategory> _categories = [];
  List<ExpenseCategory> get categories {
    return _categories;
  }

  Database? _database;
  Future<Database> get database async {
    final dbDirectory = await getDatabasesPath();
    const dbName = 'expense_tc.db';
    final path = join(dbDirectory, dbName);
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return _database!;
  }

  static const cTable = 'categoryTable';
  static const eTable = 'expenseTable';

  Future<void> _createDb(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute('''CREATE TABLE $cTable(
      title TEXT,
      entries INTEGER,
      totalAmount TEXT
    )''');
    });
    await db.transaction((txn) async {
      await txn.execute('''CREATE TABLE $eTable(
        id INTEGER PRIMARY KEY AUTOINCREAMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT,
      )''');
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(cTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmout': (0.0).toString(),
        });
      }
    });
  }

  Future<List<ExpenseCategory>> fetchCategories() async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(cTable).then((value) {
        final converted = List<Map<String, dynamic>>.from(value);
        List<ExpenseCategory> nList = List.generate(converted.length, (index) {
          return ExpenseCategory.fromString(converted[index]);
        });
        _categories = nList;
        return _categories;
      });
    });
  }
}
