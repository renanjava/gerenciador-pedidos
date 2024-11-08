import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/screens/clientes_listagem.dart';
import 'package:gerenciador_pedidos/screens/home.dart';
import 'package:gerenciador_pedidos/screens/pedidos_listagem.dart';

class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({super.key});

  @override
  NavigationBarComponentState createState() => NavigationBarComponentState();
}

class NavigationBarComponentState extends State<NavigationBarComponent> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    ClientesListagem(),
    PedidosListagem(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 260),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: NavigationBar(
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(
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
