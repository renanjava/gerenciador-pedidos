import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_pedidos/models/cliente.dart';
import 'package:gerenciador_pedidos/others/endereco.dart';
import 'package:gerenciador_pedidos/services/clientes_service.dart';

void main() {
  group('Endpoints do recurso Cliente', () {
    Endereco endereco = Endereco(rua: 'Rua dos testes', numero: '400');
    Cliente cliente = Cliente(
      dataCadastro: '00/00/0000',
      nome: 'testando',
      endereco: endereco,
    );

    test('Service deve buscar os Clientes no banco de dados', () async {
      ClientesService service = ClientesService();
      final response = await service.findAll();
      expect(List<Cliente>, response.runtimeType);
    });

    test('Service deve criar um novo cliente no banco de dados', () async {
      ClientesService service = ClientesService();
      expect("Usuário cadastrado com sucesso!", await service.create(cliente));
    });
  });
}
