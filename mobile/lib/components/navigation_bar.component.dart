import 'package:flutter/material.dart';

class NavigationBarComponent extends StatelessWidget {
  const NavigationBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
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
    );
  }
}
