// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unnecessary_null_comparison
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import '/db/journal_entry_dto.dart';
import '/models/journal_entry.dart';

class DatabaseManager{

  static String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const SQL_CREATE_FILE=  'assets/schema_1.sql.txt';
  static const SQL_INSERT = 'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)';
  static const SQL_SELECT =  'SELECT * FROM journal_entries';


  static late DatabaseManager _instance;
  late final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
  // await deleteDatabase(DATABASE_FILENAME);  //use for testing purposes to clear database to display welcome screen
    String SQL_CREATE_SCHEMA = await rootBundle.loadString(SQL_CREATE_FILE);
    final db = await openDatabase(DATABASE_FILENAME, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(SQL_CREATE_SCHEMA);
    });
    _instance = DatabaseManager._(database: db);
  }

 void saveJournalEntry({required JournalEntryDTO dto}) {
    db.transaction((txn) async {
      await txn.rawInsert(SQL_INSERT,
          [dto.title, dto.body, dto.rating, dto.date.toString()]);
    });
  }

  Future<List<JournalEntry>> journalEntries() async {
    final journalRecords = await db.rawQuery(SQL_SELECT);
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
          title: record['title'] as String,
          body: record['body'] as String,
          rating: record['rating'] as int ,
          date: DateTime.parse(record['date'] as String));
    }).toList();
    return journalEntries;
  }
}