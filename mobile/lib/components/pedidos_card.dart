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
      //ordenar pelas cores
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

  Color atribuirCor(String dataReceberString) {
    final dataAtualDate = DateTime.now();
    final String dataAtualString =
        "${dataAtualDate.day}/${dataAtualDate.month}/${dataAtualDate.year}";

    /*
    - - -  le a documentação, qualquer coisa eu passo essa data receber pra Date e uso um método do date mesmo

    diff (dataAtualString, dataReceberString)
    1 dia -> return Colors.red
    7 dias -> return Colors.yellow
    acima de 7 dias -> return Colors.green
    */

    return Colors.black;
  }
}
