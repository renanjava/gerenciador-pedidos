import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/clientes_card.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';

const tituloPagina = 'Listagem de clientes';

class ClientesListagem extends StatelessWidget {
  const ClientesListagem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(tituloPagina),
          backgroundColor: Colors.blue,
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(
            130.0,
            30.0,
            130.0,
            30.0,
          ),
          child: ClientesCard(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }
}
