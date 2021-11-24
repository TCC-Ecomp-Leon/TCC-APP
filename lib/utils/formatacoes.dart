String diaMes(DateTime date) {
  String dia = date.day.toString();
  String mes = date.month.toString();
  while (dia.length < 2) {
    dia = " " + dia;
  }
  while (mes.length < 2) {
    mes = " " + mes;
  }

  return dia + "/" + mes;
}

String diaComAno(DateTime date) {
  String dia = date.day.toString();
  String mes = date.month.toString();
  String ano = date.year.toString();
  while (dia.length < 2) {
    dia = " " + dia;
  }
  while (mes.length < 2) {
    mes = " " + mes;
  }
  while (ano.length < 4) {
    ano = " " + ano;
  }

  return dia + "/" + mes + "/" + ano;
}
