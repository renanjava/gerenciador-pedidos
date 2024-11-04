import 'package:gerenciador_pedidos/endereco/endereco.dart';

class Cliente {
  final String idUsuario;
  final String nome;
  final String dataCadastro;
  final Endereco endereco;

  Cliente({
    required this.idUsuario,
    required this.nome,
    required this.dataCadastro,
    required this.endereco,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      idUsuario: json['id'],
      nome: json['nome'],
      dataCadastro: json['dataCadastro'],
      endereco: Endereco.fromJson(json['endereco']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'nome': nome,
      'dataCadastro': dataCadastro,
      'endereco': endereco.toJson(),
    };
  }
}
