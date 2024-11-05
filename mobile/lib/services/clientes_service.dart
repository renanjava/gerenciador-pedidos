import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/models/cliente.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClientesService {
  Future<List<Cliente>> findAll() async {
    Uri uri = Uri.parse("http://localhost:3000/clientes");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Cliente.fromJson(json)).toList();
    }
    throw Exception("Erro ao buscar clientes");
  }

  Future<void> create(Cliente cliente) async {
    Uri uri = Uri.parse("http://localhost:3000/clientes");
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        cliente.toJson(),
      ),
    );

    if (response.statusCode == 201) {
      debugPrint("Usuário cadastrado com sucesso!");
    } else {
      debugPrint("Erro ao cadastrar usuário: ${response.statusCode}");
    }
  }

  Future<Cliente> findById(String id) async {
    Uri uri = Uri.parse('http://localhost:3000/clientes/$id');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Cliente.fromJson(data);
    }
    throw Exception("Erro ao buscar cliente");
  }
}
