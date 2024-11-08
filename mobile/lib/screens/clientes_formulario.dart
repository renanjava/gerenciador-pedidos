import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';
import 'package:gerenciador_pedidos/models/cliente.dart';
import 'package:gerenciador_pedidos/others/endereco.dart';
import 'package:gerenciador_pedidos/services/clientes_service.dart';
import 'package:uuid/uuid.dart';

const tituloPagina = 'Formulário de Clientes';

class ClientesFormulario extends StatelessWidget {
  final TextEditingController nome = TextEditingController();
  final TextEditingController dataCadastro = TextEditingController();
  final TextEditingController ruaEndereco = TextEditingController();
  final TextEditingController numeroEndereco = TextEditingController();

  ClientesFormulario({super.key});

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
              const SizedBox(height: 20),
              _buildTextField(nome, 'Nome', Icons.account_circle_outlined),
              const SizedBox(height: 20),
              _buildTextField(dataCadastro, 'Data de Cadastro',
                  Icons.date_range, TextInputType.datetime),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildTextField(
                          ruaEndereco, 'Rua', Icons.assistant_photo_outlined),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _buildTextField(numeroEndereco, 'Número',
                          Icons.numbers, TextInputType.number),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  criaCliente();
                  Navigator.pop(context);
                },
                child: const Text('Confirmar Cadastro',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
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

  void criaCliente() async {
    ClientesService service = ClientesService();
    Uuid uuid = const Uuid();
    Endereco endereco = Endereco(
      rua: ruaEndereco.text,
      numero: numeroEndereco.text,
    );
    Cliente clienteForm = Cliente(
      idCliente: uuid.v4(),
      nome: nome.text,
      dataCadastro: dataCadastro.text,
      endereco: endereco,
    );

    await service.create(clienteForm);
  }
}
