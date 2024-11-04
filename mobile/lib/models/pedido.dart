class Pedido {
  final String idPedido;
  final String idUsuario;
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

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      idPedido: json['idPedido'] ?? '',
      idUsuario: json['idUsuario'] ?? '',
      valor: (json['valor'] ?? 0.0).toDouble(),
      descricao: json['descricao'] ?? '',
      dataPedido: json['dataPedido'] ?? '',
      dataReceber: json['dataReceber'] ?? '',
      pago: json['pago'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPedido': idPedido,
      'idUsuario': idUsuario,
      'valor': valor,
      'descricao': descricao,
      'dataPedido': dataPedido,
      'dataReceber': dataReceber,
      'pago': pago,
    };
  }
}
