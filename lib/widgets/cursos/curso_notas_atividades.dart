import 'package:flutter/material.dart';
import 'package:tcc_app/utils/base64_image.dart';
import 'package:tcc_app/utils/formatacoes.dart';

class CardCursoNotasAtividade extends StatelessWidget {
  final MockCurso curso;
  const CardCursoNotasAtividade({
    required this.curso,
    Key? key,
  }) : super(key: key);

  Widget buildCardUltimasAtividades(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < 3 && i < curso.ultimasNotas.length; i++) {
      MockCursoNota nota = curso.ultimasNotas[i];
      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              nota.nomeMateria,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              nota.nota.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
    return Card(
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }

  Widget buildCardProximasAtividades(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < 3 && i < curso.proximasAtividades.length; i++) {
      MockCursoAtividade atividade = curso.proximasAtividades[i];
      children.add(
        Text(
          diaMes(atividade.dia) + " - " + atividade.nomeAtividade,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }
    return Card(
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.67,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double dimLogoCurso = MediaQuery.of(context).size.width * 0.2;
    double dimIconCalendar = dimLogoCurso * 0.8;
    CursoIcon cursoIcon = getCursoStatusIcon(curso);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: dimLogoCurso,
                  height: dimLogoCurso,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: imageFromBase64String(curso.imagem).image,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      curso.nome,
                      textScaleFactor: 2.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildCardUltimasAtividades(context),
                  ],
                ),
                Icon(
                  cursoIcon.iconData,
                  size: dimLogoCurso / 2,
                  color: cursoIcon.color,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_note,
                  color: Colors.blue,
                  size: dimIconCalendar,
                ),
                buildCardProximasAtividades(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CursoIcon {
  IconData iconData;
  Color color;
  CursoIcon({
    required this.iconData,
    required this.color,
  });
}

CursoIcon getCursoStatusIcon(MockCurso curso) {
  if (curso.ultimasNotas.isNotEmpty) {
    if (curso.ultimasNotas[0].nota < 4.0) {
      return CursoIcon(
        iconData: Icons.warning,
        color: Colors.red,
      );
    } else if (curso.ultimasNotas[0].nota < 6.0) {
      return CursoIcon(
        iconData: Icons.info,
        color: Colors.yellow,
      );
    }
  }
  return CursoIcon(
    iconData: Icons.check_circle,
    color: Colors.green,
  );
}

class MockCursoNota {
  String nomeMateria;
  double nota;
  MockCursoNota({
    required this.nomeMateria,
    required this.nota,
  });
}

class MockCursoAtividade {
  String nomeAtividade;
  DateTime dia;
  MockCursoAtividade({
    required this.nomeAtividade,
    required this.dia,
  });
}

class MockCurso {
  String nome;
  String imagem;
  List<MockCursoNota> ultimasNotas;
  List<MockCursoAtividade> proximasAtividades;
  MockCurso({
    required this.nome,
    required this.imagem,
    required this.ultimasNotas,
    required this.proximasAtividades,
  });
}
