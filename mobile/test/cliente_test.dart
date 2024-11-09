import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_pedidos/models/cliente.dart';
import 'package:gerenciador_pedidos/others/endereco.dart';

void main() {
  group('Testando atributos do Cliente', () {
    Endereco endereco = Endereco(rua: 'Rua dos testes', numero: '400');
    Cliente cliente = Cliente(
      dataCadastro: '00/00/0000',
      nome: 'tester',
      endereco: endereco,
    );

    test('Cliente deve ter uma Data de Cadastro', () {
      expect('00/00/0000', cliente.dataCadastro);
    });

    test('Cliente deve ter um Nome', () {
      expect('tester', cliente.nome);
    });

    test('Cliente deve ter um Endereço', () {
      expect('Rua dos testes', cliente.endereco.rua);
      expect('400', cliente.endereco.numero);
    });
  });
}
