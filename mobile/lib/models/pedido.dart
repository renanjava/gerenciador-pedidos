class Pedido {
  final String id;
  final String nomeCliente;
  final double valor;
  final String descricao;
  final String dataPedido;
  final String dataReceber;
  final bool pago;

  Pedido({
    required this.id,
    required this.nomeCliente,
    required this.valor,
    required this.descricao,
    required this.dataPedido,
    required this.dataReceber,
    this.pago = false,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'] ?? '',
      nomeCliente: json['nomeCliente'] ?? '',
      valor: (json['valor'] ?? 0.0).toDouble(),
      descricao: json['descricao'] ?? '',
      dataPedido: json['dataPedido'] ?? '',
      dataReceber: json['dataReceber'] ?? '',
      pago: json['pago'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeCliente': nomeCliente,
      'valor': valor,
      'descricao': descricao,
      'dataPedido': dataPedido,
      'dataReceber': dataReceber,
      'pago': pago,
    };
  }
}
