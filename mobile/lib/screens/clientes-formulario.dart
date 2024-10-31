import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation-bar.component.dart';

class ClientesFormulario extends StatelessWidget {
  const ClientesFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de clientes'),
          backgroundColor: Colors.blue,
        ),
        body: ListView(),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }
}
