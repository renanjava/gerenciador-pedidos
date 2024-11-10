import 'package:flutter/material.dart';
import 'package:gerenciador_pedidos/models/cliente.dart';
import 'package:gerenciador_pedidos/models/pedido.dart';
import 'package:gerenciador_pedidos/services/clientes_service.dart';
import 'package:gerenciador_pedidos/services/pedidos_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';

const tituloPagina = 'Gerenciamento de Pedidos Pendentes';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Cliente> _topCliente;
  late Future<Pedido> _topPedido;
  late Future<Pedido> _pedidoMaisCaro;

  @override
  void initState() {
    super.initState();
    _topCliente = ClientesService().findTopClienteComMaisPedidos();
    _topPedido = PedidosService().findTopPedido();
    _pedidoMaisCaro = PedidosService().findPedidoMaisCaro();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.indigo[400],
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            tituloPagina,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildTopClienteSection(),
            _buildTopPedidoSection(),
            _buildPedidoMaisCaroSection(),
          ],
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }

  Widget _buildTopClienteSection() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: FutureBuilder<Cliente>(
        future: _topCliente,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (snapshot.hasData) {
            Cliente cliente = snapshot.data!;
            return Column(
              children: [
                Text(
                  'Cliente com a maior quantidade de pedidos pendentes: ${cliente.nome}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          'O cliente ${cliente.nome} tem ${cliente.quantidadePedidos} pedidos a receber',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text('Nenhum cliente encontrado.');
          }
        },
      ),
    );
  }

  Widget _buildTopPedidoSection() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: FutureBuilder<Pedido>(
        future: _topPedido,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (snapshot.hasData) {
            Pedido pedido = snapshot.data!;
            return Column(
              children: [
                Text(
                  'Pedido expirado por mais tempo, data a receber: ${pedido.dataReceber}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          'Pedido expirado por mais tempo é do cliente: ${pedido.nomeCliente}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text('Nenhum pedido encontrado.');
          }
        },
      ),
    );
  }

  Widget _buildPedidoMaisCaroSection() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: FutureBuilder<Pedido>(
        future: _pedidoMaisCaro,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (snapshot.hasData) {
            Pedido pedido = snapshot.data!;
            return Column(
              children: [
                Text(
                  'Pedido mais caro: R\$ ${pedido.valor}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          'Cliente: ${pedido.nomeCliente}, Valor: R\$ ${pedido.valor}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text('Nenhum pedido encontrado.');
          }
        },
      ),
    );
  }
}
