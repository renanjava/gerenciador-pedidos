import 'package:flutter/material.dart';

const pageTitle = 'Gerenciamento de pedidos pendentes';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(pageTitle),
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
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    child: const Text('Visualizar todos',
                        style: TextStyle(color: Colors.black)),
                  )
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
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    child: const Text('Visualizar todos',
                        style: TextStyle(color: Colors.black)),
                  )
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
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    child: const Text('Visualizar todos',
                        style: TextStyle(color: Colors.black)),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.notifications_sharp)),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}
