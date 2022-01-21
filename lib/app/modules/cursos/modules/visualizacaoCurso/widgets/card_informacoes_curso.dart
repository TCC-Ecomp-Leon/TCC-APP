import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardInformacoesCurso extends StatelessWidget {
  final String nomeCurso;
  final String descricaoCurso;
  final DateTime inicioCurso;
  final DateTime fimCurso;

  const CardInformacoesCurso({
    required this.nomeCurso,
    required this.descricaoCurso,
    required this.inicioCurso,
    required this.fimCurso,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 110.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildCampo(
                                "Nome",
                                nomeCurso,
                              ),
                              buildCampo("Descrição", descricaoCurso),
                            ],
                          ),
                        ),
                        duracaoCurso(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Curso",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget duracaoCurso() {
    int diasCurso = fimCurso.difference(inicioCurso).inDays;
    int diasCursados = DateTime.now().difference(inicioCurso).inDays;
    if (diasCursados > diasCurso) {
      diasCursados = diasCurso;
    }

    return CircularPercentIndicator(
      radius: 70.0,
      lineWidth: 8.0,
      animation: true,
      percent: 0.7,
      center: Text(
        diasCursados.toString() + "/" + diasCurso.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textScaleFactor: 0.8,
      ),
      footer: const Padding(
        padding: EdgeInsets.only(
          top: 5.0,
        ),
        child: Text(
          "Dias Curso",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.purple,
    );
  }

  Widget buildCampo(String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + ":",
          textAlign: TextAlign.start,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
