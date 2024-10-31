import 'package:flutter/material.dart';

const tituloPagina = 'Gerenciamento de pedidos pendentes';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(tituloPagina),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  const Text(
                    'PEDIDOS PRÓXIMOS DE EXPIRAR',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 300,
                    width: 700,
                    color: Colors.grey[350],
                    child: const Center(
                      child: Row(
                        children: [
                          Card(),
                        ],
                      ),
                    ),
                  ),            
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  const Text(
                    'PEDIDOS PRÓXIMOS DE EXPIRAR',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 300,
                    width: 700,
                    color: Colors.grey[350],
                    child: const Center(
                      child: Row(
                        children: [
                          Card(),
                        ],
                      ),
                    ),
                  ),                 
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  const Text(
                    'PEDIDOS PRÓXIMOS DE EXPIRAR',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 300,
                    width: 700,
                    color: Colors.grey[350],
                    child: const Center(
                      child: Row(
                        children: [
                          Card(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              //selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Início',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Clientes',
            ),
            NavigationDestination(
              icon: Icon(Icons.backup_table),
              label: 'Pedidos',
            ),
          ],
        ),
      ),
    );
  }
}
