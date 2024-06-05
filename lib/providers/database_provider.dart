import 'dart:async';

import 'package:sqflite/sqflite.dart' as sql;

class DatabaseProvider {
  // singleton | design pattern (padrão de projeto)
  DatabaseProvider._privateConstructor();
  static final DatabaseProvider instance = DatabaseProvider._privateConstructor();
  static sql.Database? _database;
  Future<sql.Database> get database async => _database ??= await _db();

  Future<sql.Database> _db() async {
    return sql.openDatabase(
      'academico-fema-app.db', version: 1,
      onCreate: _onCreate
    );
  }

  FutureOr<void> _onCreate(sql.Database db, int version) async {
    await db.execute('''
      CREATE TABLE ALUNOS(
        RA TEXT PRIMARY KEY NOT NULL,
        NOME TEXT NOT NULL,
        EMAIL TEXT NOT NULL
      )
    ''');

    //Criando tabela de Curso no Banco
      await db.execute('''
      CREATE TABLE CURSOS(
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        NOME TEXT NOT NULL,
        TURNO TEXT NOT NULL,
        NUMEROALUNO TEXT NOT NULL,
        CAMPUS TEXT NOT NULL
      )
      ''');
  }
  
}
