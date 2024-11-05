import 'package:flutter/material.dart';
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
      pedidos = fetchedPedidos;
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
          child: ListTile(
            leading: const Icon(Icons.backup_table),
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
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () {},
                    ),
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
}
