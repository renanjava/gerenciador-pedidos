class Endereco {
  final String rua;
  final String numero;

  Endereco({required this.rua, required this.numero});

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      rua: json['rua'],
      numero: json['numero'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rua': rua,
      'numero': numero,
    };
  }
}
