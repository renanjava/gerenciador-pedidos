import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation-bar.component.dart';

const tituloPagina = 'Formulário de clientes';

class ClientesFormulario extends StatelessWidget {
  final TextEditingController idCliente = TextEditingController();
  final TextEditingController nome = TextEditingController();
  final TextEditingController dataCadastro = TextEditingController();
  final TextEditingController ruaEndereco = TextEditingController();
  final TextEditingController numeroEndereco = TextEditingController();

  ClientesFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(tituloPagina),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(170.0, 25.0, 170.0, 0.0),
          child: Column(
            children: [
              TextField(
                controller: idCliente,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                    icon: Icon(Icons.insert_drive_file),
                    labelText: 'ID',
                    hintText: '000'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nome,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                    icon: Icon(Icons.account_circle_outlined),
                    labelText: 'Nome',
                    hintText: 'Fulano'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: dataCadastro,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                    icon: Icon(Icons.date_range),
                    labelText: 'Data de Cadastro',
                    hintText: '00/00/0000'),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: ruaEndereco,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        decoration: const InputDecoration(
                            icon: Icon(Icons.assistant_photo_outlined),
                            labelText: 'Rua',
                            hintText: ''),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: TextField(
                        controller: numeroEndereco,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        decoration: const InputDecoration(
                            icon: Icon(Icons.numbers),
                            labelText: 'Número',
                            hintText: '0000'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  child: const Text(
                    'Confirmar Cadastro',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ],
          ),
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }
}
