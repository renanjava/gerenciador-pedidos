import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';

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
                    '...',
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
                    '...',
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
                    '...',
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
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }
}
