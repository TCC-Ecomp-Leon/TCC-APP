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

String formatarMinutosHoras(int minutos) {
  int? horas;
  while (minutos > 60) {
    horas ??= 0;
    horas = horas + 1;
    minutos = minutos - 60;
  }
  String ret = "";
  if (horas != null) {
    ret = horas.toString() + "h ";
  }
  ret = ret + minutos.toString() + "min";
  return ret;
}

String tempoEntreDatas(DateTime fim, DateTime inicio) {
  int? horas;
  if (fim.difference(inicio).inDays > 1) {
    return fim.difference(inicio).inDays.toString() + " dias";
  }
  while (fim.difference(inicio).inMinutes > 60) {
    horas ??= 0;
    horas = horas + 1;
    fim = fim.subtract(const Duration(hours: 1));
  }
  int minutos = fim.difference(inicio).inMinutes;

  String ret = "";
  if (horas != null) {
    ret = horas.toString() + "h ";
  }
  ret = ret + minutos.toString() + "min";
  return ret;
}
