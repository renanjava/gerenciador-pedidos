import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_pedidos/models/pedido.dart';

void main() {
  group('Testando atributos do Pedido', () {
    Pedido pedido = Pedido(
        id: '80777',
        nomeCliente: '494432',
        valor: 32.00,
        descricao: 'Cartão não passou na hora da entrega',
        dataPedido: '31/10/2024',
        dataReceber: '01/11/2024');

    test('Pedido deve ter um ID', () {
      expect('80777', pedido.id);
    });

    test('Pedido deve ter um Nome do Cliente', () {
      expect('494432', pedido.nomeCliente);
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
