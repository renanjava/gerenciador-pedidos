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
            '$tituloPagina - ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade700,
          elevation: 6.0,
          shadowColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
            130.0,
            30.0,
            130.0,
            30.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8.0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const PedidosCard(),
          ),
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
