// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation-bar.component.dart';

const tituloPagina = 'Listagem de pedidos';
final dataAtual = DateTime.now();
const vermelho = Color.fromARGB(255, 226, 105, 105);
const amarelo = Color.fromARGB(255, 216, 202, 77);
const verde = Color.fromARGB(255, 100, 190, 103);
const icone = Icons.backup_table;

class PedidosListagem extends StatelessWidget {
  const PedidosListagem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('$tituloPagina - ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}'),
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
                    color: vermelho,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: amarelo,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: amarelo,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: amarelo,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
                    ),
                  ),
                  Card(
                    color: verde,
                    child: ListTile(
                      leading: Icon(icone),
                      title: Text('valor1'),
                      subtitle: Text('descricao1'),
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
