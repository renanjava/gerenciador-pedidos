import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';
import 'package:gerenciador_pedidos/components/pedidos_card.dart';
import 'package:gerenciador_pedidos/screens/pedidos_formulario.dart';

const tituloPagina = 'Listagem de pedidos';
final dataAtual = DateTime.now();

class PedidosListagem extends StatelessWidget {
  const PedidosListagem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              '$tituloPagina - ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}'),
          backgroundColor: Colors.blue,
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(
            130.0,
            30.0,
            130.0,
            30.0,
          ),
          child: PedidosCard(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PedidosFormulario()),
          ),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }
}
