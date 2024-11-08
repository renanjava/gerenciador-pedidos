import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/models/pedido.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PedidosService {
  Future<List<Pedido>> findAll() async {
    Uri uri = Uri.parse("http://localhost:3000/pedidos");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final dataUtf8 = utf8.decode(response.bodyBytes);
      final List<dynamic> dataDecode = json.decode(dataUtf8);
      return dataDecode.map((json) => Pedido.fromJson(json)).toList();
    }
    throw Exception("Erro ao buscar pedidos");
  }

  Future<String> create(Pedido pedido) async {
    Uri uri = Uri.parse("http://localhost:3000/pedidos");
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(pedido.toJson()),
    );

    if (response.statusCode == 201) {
      debugPrint("Pedido cadastrado com sucesso!");
      return "Pedido cadastrado com sucesso!";
    } else {
      debugPrint("Erro ao cadastrar pedido: ${response.statusCode}");
      return "Erro ao cadastrar pedido: ${response.statusCode}";
    }
  }

  Future<Pedido> findById(String id) async {
    Uri uri = Uri.parse("http://localhost:3000/pedidos/$id");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final dataUtf8 = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> data = json.decode(dataUtf8);
      return Pedido.fromJson(data);
    }
    throw Exception("Erro ao buscar pedido");
  }

  Future<void> atualizarQuantidadePedidos(
      String idCliente, int novaQuantidade) async {
    final url = 'http://localhost:3000/clientes/$idCliente';
    final response = await http.patch(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: '{"quantidadePedidos": $novaQuantidade}',
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar a quantidade de pedidos do cliente');
    }
  }
}
