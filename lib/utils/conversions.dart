int? entradaTextoComCaracteresParaNumero(String entrada) {
  String processado =
      entrada.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "");
  return int.tryParse(processado);
}
