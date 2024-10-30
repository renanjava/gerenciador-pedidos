class Pedido {
  final BigInt idPedido;
  final BigInt idUsuario;
  final double valor;
  final String descricao;
  final String dataPedido;
  final String dataReceber;
  final bool pago;

  Pedido({
    required this.idPedido,
    required this.idUsuario,
    required this.valor,
    required this.descricao,
    required this.dataPedido,
    required this.dataReceber,
    this.pago = false,
  });
}
