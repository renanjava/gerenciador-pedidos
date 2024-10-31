import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation-bar.component.dart';

class ClientesFormulario extends StatelessWidget {
  final TextEditingController idCliente;

  const ClientesFormulario({super.key, required this.idCliente});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de clientes'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(170.0, 0.0, 170.0, 0.0),
          child: Column(
            children: [
              TextField(
                controller: idCliente,

              ),
            ],
          )
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }
}
