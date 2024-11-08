import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/clientes_card.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';
import 'package:gerenciador_pedidos/screens/clientes_formulario.dart';

const tituloPagina = 'Listagem de clientes';

class ClientesListagem extends StatelessWidget {
  const ClientesListagem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            tituloPagina,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          elevation: 4.0,
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
            child: const ClientesCard(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClientesFormulario()),
          ),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }
}
