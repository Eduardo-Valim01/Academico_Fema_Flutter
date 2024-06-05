
import 'dart:math';
import 'package:faker/faker.dart';

class Curso {
  static final faker = Faker();

  String id;
  String nome;
  String turno;
  int numeroAlunos;
  String campus;

  Curso(
      {required this.id,
      required this.nome,
      required this.turno,
      required this.numeroAlunos,
      required this.campus});

  static fake() {
    final id = faker.randomGenerator.numberOfLength(3);
    final nome = faker.person.firstName();
    final turnos = ['Manhã', 'Tarde', 'Noturno'];
    final turno = turnos[Random().nextInt(turnos.length)];
    final numeroAlunos = faker.randomGenerator.integer(45, min: 25);
    final campus = [
      'Campus de São Carlos.',
      'Campus de Ribeirão Preto',
      'Campus de Pirassununga',
      'Campus de Bauru',
      'Campus de Piracicaba'
    ];
    final campu = campus[Random().nextInt(campus.length)];
  return Curso(id: id, nome: '$nome',  turno: turno, numeroAlunos: numeroAlunos, campus: campu );
  }

  // select (busca de dados): select RA, NOME, EMAIL from alunos;
  factory Curso.fromMap(Map<String, dynamic> values) => Curso(
        id: values['ID'],
        nome: values['NOME'],
        turno: values['TURNO'],
        numeroAlunos: values['NUMERO'],
        campus: values['CAMPUS'],
      );
      // insert | update
  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'NOME': nome,
      'TURNO': turno,
      'NUMEROALUNOS': numeroAlunos,
      'CAMPUS': campus,
    };
}
 @override
  String toString() {
    return '$id - $nome - $turno - $numeroAlunos - $campus';
  }
}
