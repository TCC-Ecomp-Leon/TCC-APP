String diaAtividade(DateTime date) {
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
