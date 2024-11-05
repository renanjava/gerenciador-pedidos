import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_pedidos/screens/home.dart';

void main() {
  testWidgets('Home deve ter um titulo da página', (tester) async {
    await tester.pumpWidget(const Home());
    expect(find.text('Gerenciamento de pedidos pendentes'), findsOneWidget);
  });
}
