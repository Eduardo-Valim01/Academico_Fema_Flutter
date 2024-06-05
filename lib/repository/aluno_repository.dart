import 'package:academico_fema_app/model/aluno.dart';
import 'package:academico_fema_app/providers/database_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class AlunoRepository {
  Future<int> save(Aluno aluno) async {
    final sql.Database database = await DatabaseProvider.instance.database;
    return await database.insert('ALUNOS', aluno.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Aluno>> findAll() async {
    final sql.Database database = await DatabaseProvider.instance.database;
    // SELECT RA, NOME, EMAIL FROM ALUNOS ORDER BY NOME;
    final alunosMap = await database.query('ALUNOS', orderBy: 'NOME');
    final List<Aluno> alunos = _toList(alunosMap);
    return alunos;
  }

  Future<List<Aluno>> findByNome(String? nome) async {
    if (nome == null || nome.isEmpty) {
      return findAll();
    }
    final sql.Database database = await DatabaseProvider.instance.database;
    // sql injection
    // "me" = Guilherme
    // SELECT RA, NOME, EMAIL FROM ALUNOS WHERE NOME LIKE '%LHE%' ORDER BY RA;
    final alunosMap = await database.query('ALUNOS',
        where: 'NOME LIKE ?',
        whereArgs: [
          '%$nome%'
        ],
        orderBy: 'RA');
    final List<Aluno> alunos = _toList(alunosMap);
    return alunos;
  }

  // deleteByRa | rawDelete = delete + where + whereArgs

  Future<void> deleteByRa(String ra) async {
    final sql.Database database = await DatabaseProvider.instance.database;
    database.delete('ALUNOS', where: 'RA = ?', whereArgs: [
      ra
    ]);
  }

  Future<void> clear() async {
    final sql.Database database = await DatabaseProvider.instance.database;
    database.rawDelete('DELETE FROM ALUNOS');
  }

  List<Aluno> _toList(List<Map<String, Object?>> values) {
    return values.isEmpty ? List.empty() : values.map((e) => Aluno.fromMap(e)).toList();
  }
}
