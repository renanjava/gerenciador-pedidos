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
}
