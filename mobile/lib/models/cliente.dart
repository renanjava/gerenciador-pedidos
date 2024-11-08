import 'package:gerenciador_pedidos/others/endereco.dart';

class Cliente {
  final String idCliente;
  final String nome;
  final String dataCadastro;
  final Endereco endereco;
  int quantidadePedidos;

  Cliente({
    required this.idCliente,
    required this.nome,
    required this.dataCadastro,
    required this.endereco,
    this.quantidadePedidos = 0,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      idCliente: json['id'],
      nome: json['nome'],
      dataCadastro: json['dataCadastro'],
      endereco: Endereco.fromJson(json['endereco']),
      quantidadePedidos: json['quantidadePedidos'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCliente': idCliente,
      'nome': nome,
      'dataCadastro': dataCadastro,
      'endereco': endereco.toJson(),
      'quantidadePedidos': quantidadePedidos,
    };
  }

  @override
  String toString() {
    return 'Cliente{idCliente: $idCliente, nome: $nome, dataCadastro: $dataCadastro, endereco: ${endereco.toString()}, quantidadePedidos: $quantidadePedidos}';
  }
}
