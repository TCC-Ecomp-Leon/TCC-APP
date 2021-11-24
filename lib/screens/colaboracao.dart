import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/label_description_card.dart';

class Colaboracao extends StatelessWidget {
  const Colaboracao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MockAtivideColaborativa> atividades = criarMockAtividades();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Atividades para colaborar",
                        textScaleFactor: 1.3,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: atividades.length,
                itemBuilder: (BuildContext context, int index) {
                  MockAtivideColaborativa atividade = atividades[index];
                  double espacoDisponivel =
                      MediaQuery.of(context).size.width - 22.0;
                  return LabelDescriptionCard(
                    value: LabelDescriptionCardProps(
                      label: atividade.nomeAtividade,
                      labelSufix: textoTipoAtividade(
                          atividade.tipoAtividadeColaborativa),
                      description: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: espacoDisponivel * 0.33,
                            child: Text(
                              "Curso: " + atividade.nomeCurso,
                              textScaleFactor: 0.6,
                            ),
                          ),
                          SizedBox(
                            width: espacoDisponivel * 0.33,
                            child: atividade.nomeMateria != null
                                ? Text(
                                    "Matéria: " + atividade.nomeMateria!,
                                    textScaleFactor: 0.6,
                                  )
                                : Container(),
                          ),
                          SizedBox(
                            width: espacoDisponivel * 0.17,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  tempoColaboracao(atividade.tempoColaboracao),
                                  textScaleFactor: 0.6,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: espacoDisponivel * 0.17,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  tempoFinalizarAtividade(atividade.fechaEm),
                                  textScaleFactor: 0.6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

String tempoColaboracao(int minutos) {
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

String tempoFinalizarAtividade(DateTime fechaEm) {
  DateTime now = DateTime.now();

  int? dias;
  int? horas;
  if (fechaEm.difference(now).inDays > 1) {
    return fechaEm.difference(now).inDays.toString() + " dias";
  }
  while (fechaEm.difference(now).inMinutes > 60) {
    horas ??= 0;
    horas = horas + 1;
    fechaEm = fechaEm.subtract(const Duration(hours: 1));
  }
  int minutos = fechaEm.difference(now).inMinutes;

  String ret = "";
  if (horas != null) {
    ret = horas.toString() + "h ";
  }
  ret = ret + minutos.toString() + "min";
  return ret;
}

String textoTipoAtividade(TipoAtividadeColaborativa tipo) {
  if (tipo == TipoAtividadeColaborativa.bancoDeQuestoes) {
    return "Criação";
  } else {
    return "Correção";
  }
}

List<MockAtivideColaborativa> criarMockAtividades() {
  List<MockAtivideColaborativa> ret = [];

  for (int i = 0; i < 20; i++) {
    MockAtivideColaborativa atividade = MockAtivideColaborativa(
      nomeAtividade: "Atividade Mockada " + i.toString(),
      tipoAtividadeColaborativa: TipoAtividadeColaborativa.correcao,
      nomeMateria: i % 10 == 0 ? null : "Matéria Teste " + (i % 5).toString(),
      nomeCurso: "Curso Teste " + (i % 2).toString(),
      criadoEm: DateTime.now().subtract(Duration(days: i)),
      respondidoEm: DateTime.now().subtract(const Duration(days: 1)),
      fechaEm: DateTime.now().add(const Duration(days: 1)),
      tempoColaboracao: i * 10,
      questoes: [1, 2, 3, 4].map(
        (value) {
          return MockQuestaoDissertativaAtividade(
            enunciado:
                "(${value.toString()}) Pergunta dissertativa teste em um curso eventualmente em uma matéria. Essa pergunta serão configuradas e armazenadas no banco de dados",
            resposta:
                "Resposta mockada à pergunta dissertativa para apenas fins de visualização",
            respostaEsperada:
                "Essa é uma pergunta mockada e a resposta é irrelevante",
            nota: null,
            comentarios: null,
            status: null,
          );
        },
      ).toList(),
    );

    ret.add(atividade);
  }

  return ret;
}

enum TipoAtividadeColaborativa {
  correcao,
  bancoDeQuestoes,
}

class MockAtivideColaborativa {
  final String nomeAtividade;
  final TipoAtividadeColaborativa tipoAtividadeColaborativa;
  final String? nomeMateria;
  final String nomeCurso;
  final DateTime criadoEm;
  final DateTime? respondidoEm;
  final DateTime fechaEm;
  final int tempoColaboracao;
  final List<MockQuestaoDissertativaAtividade> questoes;

  MockAtivideColaborativa({
    required this.nomeAtividade,
    required this.tipoAtividadeColaborativa,
    required this.nomeMateria,
    required this.nomeCurso,
    required this.criadoEm,
    required this.respondidoEm,
    required this.fechaEm,
    required this.tempoColaboracao,
    required this.questoes,
  });
}

enum StatusMockQuestaoDissertativaAtividade { errado, certo, parcialmenteCerto }

class MockQuestaoDissertativaAtividade {
  final String enunciado;
  final String resposta;
  final String respostaEsperada;
  int? nota;
  String? comentarios;
  StatusMockQuestaoDissertativaAtividade? status;

  MockQuestaoDissertativaAtividade({
    required this.enunciado,
    required this.resposta,
    required this.respostaEsperada,
    required this.nota,
    required this.comentarios,
    required this.status,
  });
}
