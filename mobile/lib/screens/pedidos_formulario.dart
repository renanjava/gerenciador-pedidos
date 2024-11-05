import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';

const tituloPagina = 'Formulário de pedidos';

class PedidosFormulario extends StatelessWidget {
  final TextEditingController idPedido = TextEditingController();
  final TextEditingController idCliente = TextEditingController();
  final TextEditingController valor = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  final TextEditingController dataPedido = TextEditingController();
  final TextEditingController dataReceber = TextEditingController();

  PedidosFormulario({super.key});

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
              const SizedBox(
                height: 20,
              ),

              //listagem de clientes existentes para atribuir o pedido nele

              TextField(
                controller: valor,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0.00'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: descricao,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                    icon: Icon(Icons.description),
                    labelText: 'Descrição',
                    hintText: 'Exemplo'),
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
                        controller: dataPedido,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        decoration: const InputDecoration(
                            icon: Icon(Icons.date_range_outlined),
                            labelText: 'Data Pedido',
                            hintText: '00/00/0000'),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: TextField(
                        controller: dataReceber,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        decoration: const InputDecoration(
                            icon: Icon(Icons.date_range_outlined),
                            labelText: 'Data para Receber',
                            hintText: '00/00/0000'),
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
                  onPressed: () {
                    criaPedido();
                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  child: const Text(
                    'Confirmar Pedido',
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

  void criaPedido() {}
}
