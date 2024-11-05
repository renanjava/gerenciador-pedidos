import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_pedidos/models/pedido.dart';

void main() {
  group('Testando atributos do Pedido', () {
    Pedido pedido = Pedido(
        idPedido: '80777',
        idCliente: '494432',
        valor: 32.00,
        descricao: 'Cartão não passou na hora da entrega',
        dataPedido: '31/10/2024',
        dataReceber: '01/11/2024');

    test('Pedido deve ter um ID do Pedido', () {
      expect('80777', pedido.idPedido);
    });

    test('Pedido deve ter um ID do Cliente', () {
      expect('494432', pedido.idCliente);
    });

    test('Pedido deve ter um Valor', () {
      expect(32.00, pedido.valor);
    });

    test('Pedido deve ter uma Descrição', () {
      expect('Cartão não passou na hora da entrega', pedido.descricao);
    });

    test('Pedido deve ter uma Data de Pedido', () {
      expect('31/10/2024', pedido.dataPedido);
    });

    test('Pedido deve ter uma Data de Recebimento', () {
      expect('01/11/2024', pedido.dataReceber);
    });
  });
}
