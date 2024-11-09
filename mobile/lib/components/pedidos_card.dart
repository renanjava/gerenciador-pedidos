import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/constants/icones.dart';
import 'package:gerenciador_pedidos/models/pedido.dart';
import 'package:gerenciador_pedidos/services/pedidos_service.dart';

class PedidosCard extends StatefulWidget {
  const PedidosCard({super.key});

  @override
  State<PedidosCard> createState() => _PedidosCardState();
}

class _PedidosCardState extends State<PedidosCard> {
  final PedidosService service;
  List<Pedido> pedidos = [];

  _PedidosCardState() : service = PedidosService();

  @override
  void initState() {
    super.initState();
    _fetchPedidos();
  }

  Future<void> _fetchPedidos() async {
    final fetchedPedidos = await service.findAll();
    setState(() {
      pedidos = ordenarPorDataRecebimento(fetchedPedidos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pedidos.length,
      itemBuilder: (context, index) {
        final pedido = pedidos[index];
        final pedidoValor = pedido.valor.toStringAsFixed(2);
        return Card(
          color: atribuirCor(pedido.dataReceber),
          child: ListTile(
            leading: const Icon(Icones.iconePedido),
            title: Text(pedidoValor),
            subtitle: Text(pedido.descricao),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${pedido.dataPedido} - ${pedido.dataReceber}'),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color atribuirCor(String dataReceberString) {
    final dataAtualDate = DateTime.now();
    final dataReceberDate =
        DateTime.parse(dataReceberString.split('/').reversed.join('-'));

    final diferencaDias = dataReceberDate.difference(dataAtualDate).inDays;

    if (diferencaDias <= 1) {
      return const Color.fromARGB(255, 226, 105, 105);
    } else if (diferencaDias <= 7) {
      return const Color.fromARGB(255, 216, 202, 77);
    }
    return const Color.fromARGB(255, 100, 190, 103);
  }

  List<Pedido> ordenarPorDataRecebimento(List<Pedido> fetchedPedidos) {
    fetchedPedidos.sort((a, b) {
      final dataA = DateTime.parse(a.dataReceber.split('/').reversed.join('-'));
      final dataB = DateTime.parse(b.dataReceber.split('/').reversed.join('-'));

      return dataA.compareTo(dataB);
    });
    return fetchedPedidos;
  }
}
