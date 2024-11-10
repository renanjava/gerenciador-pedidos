import 'package:gerenciador_pedidos/others/endereco.dart';
import 'package:uuid/uuid.dart';

class Cliente {
  final String? id;
  final String nome;
  final String dataCadastro;
  final Endereco endereco;
  int quantidadePedidos;

  Cliente({
    required this.nome,
    required this.dataCadastro,
    required this.endereco,
    this.quantidadePedidos = 0,
    this.id,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nome: json['nome'],
      dataCadastro: json['dataCadastro'],
      endereco: Endereco.fromJson(json['endereco']),
      quantidadePedidos: json['quantidadePedidos'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'dataCadastro': dataCadastro,
      'endereco': endereco.toJson(),
      'quantidadePedidos': quantidadePedidos,
    };
  }

  @override
  String toString() {
    return 'Cliente{id: $id, nome: $nome, dataCadastro: $dataCadastro, endereco: ${endereco.toString()}, quantidadePedidos: $quantidadePedidos}';
  }
}
