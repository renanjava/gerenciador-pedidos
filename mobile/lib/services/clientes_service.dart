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
}
