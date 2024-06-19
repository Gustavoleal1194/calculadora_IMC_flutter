class ImcRequires {
  String nome;
  double peso;
  double altura;

  ImcRequires({
    required this.nome,
    required this.altura,
    required this.peso,
  });

  double calcularImc() {
    return peso / (altura * altura);
  }
}
