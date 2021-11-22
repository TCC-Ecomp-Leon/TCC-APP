import 'package:flutter/material.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/atividades/pagina_atividade.dart';

class CardAtividade extends StatelessWidget {
  final MockAtividade atividade;
  const CardAtividade({required this.atividade, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconStatusAtividade iconStatusAtividade =
        getIconStatusAtividade(atividade.diaAbertura, atividade.diaFechamento);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaAtividade(
              tipoAtividade: TipoAtividade.alternativa,
              questoes: [
                Questao(
                  enunciado:
                      "Pergunta alternativa teste em um curso, eventualmente em uma matéria. Essa pergunta serão configuradas e armazenadas no banco de dados.",
                  resposta: null,
                  opcoes: [
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? true
                          : null,
                      item: "Alternativa teste A",
                    ),
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? true
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      item: "Alternativa teste B",
                    ),
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      item: "Alternativa teste C",
                    ),
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      item: "Alternativa teste D",
                    ),
                  ],
                ),
                Questao(
                  enunciado:
                      "Pergunta alternativa teste em um curso, eventualmente em uma matéria. Essa pergunta serão configuradas e armazenadas no banco de dados.",
                  resposta: null,
                  opcoes: [
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      item: "Alternativa teste A",
                    ),
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? true
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? true
                          : null,
                      item: "Alternativa teste B",
                    ),
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      item: "Alternativa teste C",
                    ),
                    OpcoesQuestao(
                      correto: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      marcacao: DateTime.now().isAfter(atividade.diaFechamento)
                          ? false
                          : null,
                      item: "Alternativa teste D",
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(atividade.nomeAtividade),
                    Text(atividade.nomeMateria ?? "Atividade de curso"),
                  ],
                ),
              ),
              Icon(
                iconStatusAtividade.icon,
                color: iconStatusAtividade.color,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: DateTime.now().isAfter(atividade.diaFechamento)
                    ? atividade.nota != null
                        ? Text(
                            (atividade.nota as double).toStringAsFixed(2),
                            textAlign: TextAlign.end,
                          )
                        : Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 15.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(diaAtividade(atividade.diaFechamento)),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconStatusAtividade {
  IconData icon;
  Color color;

  IconStatusAtividade({required this.icon, required this.color});
}

IconStatusAtividade getIconStatusAtividade(
    DateTime diaAbertura, DateTime diaFechamento) {
  DateTime now = DateTime.now();
  if (now.isAfter(diaAbertura)) {
    if (diaFechamento.isAfter(now)) {
      return IconStatusAtividade(color: Colors.green, icon: Icons.lock_open);
    } else {
      return IconStatusAtividade(color: Colors.red, icon: Icons.lock);
    }
  } else {
    return IconStatusAtividade(color: Colors.yellow, icon: Icons.lock);
  }
}

class MockAtividade {
  String? nomeMateria;
  String nomeAtividade;
  double? nota;
  DateTime diaAbertura;
  DateTime diaFechamento;

  MockAtividade({
    required this.nomeAtividade,
    required this.nomeMateria,
    required this.nota,
    required this.diaFechamento,
    required this.diaAbertura,
  });
}
