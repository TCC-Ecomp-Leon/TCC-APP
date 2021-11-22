import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/atividades/card_atividade.dart';

class AtividadesCurso extends StatelessWidget {
  final bool fechadas;
  const AtividadesCurso({
    required this.fechadas,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MockAtividade> atividades = criarMockAtividades(fechadas);

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        itemCount: atividades.length,
        itemBuilder: (BuildContext context, int index) {
          MockAtividade atividade = atividades[index];
          return CardAtividade(atividade: atividade);
        },
      ),
    );
  }
}

List<MockAtividade> criarMockAtividades(bool fechadas) {
  List<MockAtividade> ret = [];

  List<String?> materias = [
    "Matemática",
    "Física",
    "Biologia",
    "História",
    "Geografia",
    null
  ];

  for (int i = 0; i < 20; i++) {
    MockAtividade mockAtividade = MockAtividade(
        nomeMateria: materias[i % materias.length],
        nomeAtividade: "Atividade " + i.toString(),
        nota: fechadas ? 10.0 - i * 0.2 : null,
        diaAbertura: fechadas
            ? DateTime.now().subtract(Duration(days: 2 + i))
            : DateTime.now().subtract(Duration(days: 10 - i)),
        diaFechamento: fechadas
            ? DateTime.now().subtract(Duration(days: i + 1))
            : DateTime.now().add(Duration(days: i + 1)));
    ret.add(mockAtividade);
  }

  return ret;
}
