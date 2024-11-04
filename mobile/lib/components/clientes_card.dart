import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/models/cliente.dart';
import 'package:gerenciador_pedidos/services/clientes_service.dart';

class ClientesCard extends StatefulWidget {
  const ClientesCard({super.key});

  @override
  State<ClientesCard> createState() => _ClientesCardState();
}

class _ClientesCardState extends State<ClientesCard> {
  final ClientesService service;
  List<Cliente> clientes = [];

  _ClientesCardState() : service = ClientesService();

  @override
  void initState() {
    super.initState();
    _fetchClientes();
  }

  Future<void> _fetchClientes() async {
    final fetchedClientes = await service.findAll();
    setState(() {
      clientes = fetchedClientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        final cliente = clientes[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: Text(cliente.nome),
            subtitle: Text(cliente.dataCadastro),
          ),
        );
      },
    );
  }
}