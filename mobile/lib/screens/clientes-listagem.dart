import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation-bar.component.dart';

const tituloPagina = 'Listagem de clientes';
const icone = Icons.account_circle_outlined;

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
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(
                130.0,
                30.0,
                130.0,
                30.0,
              ),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('cliente1'),
                      subtitle: Text('endereco1'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('cliente1'),
                      subtitle: Text('endereco1'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('cliente1'),
                      subtitle: Text('endereco1'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('cliente1'),
                      subtitle: Text('endereco1'),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
