String diaMes(DateTime date) {
  String dia = date.day.toString();
  String mes = date.month.toString();
  while (dia.length < 2) {
    dia = "0" + dia;
  }
  while (mes.length < 2) {
    mes = "0" + mes;
  }

  return dia + "/" + mes;
}

String horario(DateTime date) {
  String horas = date.hour.toString();
  while (horas.length < 2) {
    horas = "0" + horas;
  }
  String minutos = date.minute.toString();
  while (minutos.length < 2) {
    minutos = "0" + minutos;
  }

  return horas + ":" + minutos;
}

String diaComAno(DateTime date) {
  String dia = date.day.toString();
  String mes = date.month.toString();
  String ano = date.year.toString();
  while (dia.length < 2) {
    dia = "0" + dia;
  }
  while (mes.length < 2) {
    mes = "0" + mes;
  }
  while (ano.length < 4) {
    ano = "0" + ano;
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

String textoParaTamanhoFixo(String texto, int tamanho) {
  if (texto.length < tamanho) {
    return texto;
  } else {
    return texto.substring(0, tamanho - 1) + "...";
  }
}
