import 'package:academico_fema_app/model/usuario.dart';

class UsuarioRepository {
  // banco de dados local (localstorage, sqlite) | api ('/users/')
  final Map<String, Usuario> usuarios = {
    'admin': Usuario.asAdmin('Administrador', 'admin', 'admin'),
    'user': Usuario.asUser('Usuário', 'user', 'user'),
  };

  bool usuarioExiste(String login) {
    return usuarios.containsKey(login);
  }

  // nullable (pode ser nulo = pode não existir)
  // .validar('admin', 'admin')
  Usuario? validar(String login, String senha) {
    if (usuarioExiste(login)) {
      if (usuarios[login]!.validarSenha(senha)) {
        return usuarios[login];
      }
    }
    return null;
  }
}
