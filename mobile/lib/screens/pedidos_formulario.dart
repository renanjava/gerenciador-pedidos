import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';
import 'package:gerenciador_pedidos/models/pedido.dart';
import 'package:gerenciador_pedidos/services/pedidos_service.dart';
import 'package:gerenciador_pedidos/services/clientes_service.dart';
import 'package:uuid/uuid.dart';

const tituloPagina = 'Formulário de Pedidos';

class PedidosFormulario extends StatefulWidget {
  const PedidosFormulario({super.key});

  @override
  _PedidosFormularioState createState() => _PedidosFormularioState();
}

class _PedidosFormularioState extends State<PedidosFormulario> {
  final TextEditingController idPedido = TextEditingController();
  final TextEditingController nomeCliente = TextEditingController();
  final TextEditingController valor = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  final TextEditingController dataPedido = TextEditingController();
  final TextEditingController dataReceber = TextEditingController();

  List<Map<String, dynamic>> clientes = [];

  @override
  void initState() {
    super.initState();
    _fetchClientes();
  }

  Future<void> _fetchClientes() async {
    ClientesService clientesService = ClientesService();
    var fetchedClientes = await clientesService.findAll();
    setState(() {
      clientes = fetchedClientes.map((cliente) {
        return {'id': cliente.idCliente, 'nome': cliente.nome};
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            backgroundColor: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(tituloPagina, style: TextStyle(fontSize: 20)),
          backgroundColor: Colors.indigo[400],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(170.0, 25.0, 170.0, 0.0),
          child: Column(
            children: [
              _buildClienteDropdown(),
              const SizedBox(height: 20),
              _buildTextField(
                  valor, 'Valor', Icons.monetization_on, TextInputType.number),
              const SizedBox(height: 20),
              _buildTextField(descricao, 'Descrição', Icons.description),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildTextField(dataPedido, 'Data Pedido',
                          Icons.date_range, TextInputType.datetime),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _buildTextField(dataReceber, 'Data para Receber',
                          Icons.date_range, TextInputType.datetime),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  criaPedido();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Confirmar Pedido',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }

  Widget _buildClienteDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Cliente',
        prefixIcon: Icon(Icons.person, color: Colors.indigo[300]),
      ),
      items: clientes.map((cliente) {
        return DropdownMenuItem<String>(
          value: cliente['id'],
          child: Text(cliente['nome']),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          nomeCliente.text = value ?? '';
        });
      },
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      [TextInputType keyboardType = TextInputType.text]) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.indigo[300]),
        hintText: label,
      ),
    );
  }

  void criaPedido() async {
    PedidosService service = PedidosService();
    Uuid uuid = const Uuid();

    Pedido pedidoForm = Pedido(
      idPedido: uuid.v4(),
      nomeCliente: nomeCliente.text,
      valor: double.tryParse(valor.text) ?? 0.0,
      descricao: descricao.text,
      dataPedido: dataPedido.text,
      dataReceber: dataReceber.text,
    );

    await service.create(pedidoForm);
    final clienteSelecionado =
        clientes.firstWhere((cliente) => cliente['id'] == nomeCliente.text);
    final novaQuantidadePedidos =
        (clienteSelecionado['quantidadePedidos'] ?? 0) + 1;
    await service.atualizarQuantidadePedidos(
        clienteSelecionado['id'], novaQuantidadePedidos);
  }
}
