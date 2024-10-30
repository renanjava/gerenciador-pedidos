import 'package:gerenciador_pedidos/endereco/endereco.dart';

class Cliente {
  final BigInt idUsuario;
  final String nome;
  final String dataCadastro;
  final Endereco endereco;

  Cliente({
    required this.idUsuario,
    required this.nome,
    required this.dataCadastro,
    required this.endereco,
  });
}
