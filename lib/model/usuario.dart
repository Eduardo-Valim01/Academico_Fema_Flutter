class Usuario {
  String nome;
  String login;
  String senha;
  late List<String> papeis;

  // método construtor da classe Usuario
  // parâmetros nomeados Usuario(nome: 'Guilherme', login: 'guilherme', senha: '123')
  Usuario({
    required this.nome,
    required this.login,
    required this.senha,
    List<String>? papeis,
  }) {
    this.papeis = papeis ??
        [
          'USER'
        ];
  }

  // fábrica = factory
  // padrão de projeto builder
  static asAdmin(String nome, String login, String senha) {
    return Usuario(nome: nome, login: login, senha: senha, papeis: [
      'ADMIN'
    ]);
  }

  static asUser(String nome, String login, String senha) {
    return Usuario(nome: nome, login: login, senha: senha, papeis: [
      'USER'
    ]);
  }

  // final usuario = Usuario(...);
  // usuario.toAdmin()
  toAdmin(Usuario usuario) {
    usuario.papeis.clear();
    usuario.papeis.add('ADMIN');
  }

  // boolean usuarioAdministrador = usuario.isAdmin()
  bool isAdmin() {
    return papeis.contains('ADMIN');
  }

  bool validarSenha(String senha) {
    return this.senha == senha;
  }

  // print(usuario);
  @override
  String toString() {
    return '$nome - $login - $senha - $papeis';
  }
}
