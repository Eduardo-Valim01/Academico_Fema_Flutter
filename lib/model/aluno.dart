import 'package:faker/faker.dart';

class Aluno {
  static final faker = Faker();

  String ra;
  String nome;
  String email;

  // final aluno = Aluno(ra: '123', nome: 'Guilherme', email: 'g@gmail.com');
  Aluno({required this.ra, required this.nome, required this.email});

  // final aluno = Aluno.fake()
  static fake() {
    final ra = faker.randomGenerator.numberOfLength(6);
    final nome = faker.person.firstName();
    final sobrenome = faker.person.lastName();
    // Guilherme Farto = g.farto@gmail.com
    final email = '${nome[0].toLowerCase()}.${sobrenome.toLowerCase()}@gmail.com';
    // faker.internet.email()

    return Aluno(ra: ra, nome: '$nome $sobrenome', email: email);
  }

  // select (busca de dados): select RA, NOME, EMAIL from alunos;
  factory Aluno.fromMap(Map<String, dynamic> values) => Aluno(
        ra: values['RA'],
        nome: values['NOME'],
        email: values['EMAIL'],
      );

  // insert | update
  Map<String, dynamic> toMap() {
    return {
      'RA': ra,
      'NOME': nome,
      'EMAIL': email,
    };
  }

  // sqlite | indexedDB

  @override
  String toString() {
    return '$ra - $nome - $email';
  }
}
