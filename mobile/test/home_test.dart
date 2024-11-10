import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_pedidos/screens/home.dart';

void main() {
  group('Testando a screen Home', () {
    testWidgets('Home deve ter um titulo da página', (tester) async {
      await tester.pumpWidget(const Home());
      expect(find.text('Gerenciamento de pedidos pendentes'), findsOneWidget);
    });

    testWidgets('Home deve ter uma NavigationBar', (tester) async {
      await tester.pumpWidget(const Home());
      expect(find.byType(NavigationBar), findsOneWidget);
    });
  });
}
