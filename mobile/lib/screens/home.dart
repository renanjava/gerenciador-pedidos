import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gerenciador_pedidos/components/navigation_bar.component.dart';

const tituloPagina = 'Gerenciamento de Pedidos Pendentes';

class Home extends StatelessWidget {
  const Home({super.key});

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
            _buildSection(),
            _buildSection(),
            _buildSection(),
          ],
        ),
        bottomNavigationBar: const NavigationBarComponent(),
      ),
    );
  }

  Widget _buildSection() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const Text(
            '...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                  Icon(Icons.assignment, color: Colors.indigo[800], size: 40),
                  const SizedBox(width: 10),
                  Text(
                    'Conteúdo do Pedido',
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
      ),
    );
  }
}
