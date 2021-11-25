import 'package:flutter/material.dart';
import 'package:tcc_app/screens/colaboracao/card_colaboradas.dart';
import 'package:tcc_app/screens/colaboracao/pagina_atividade.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/label_description_card.dart';

class Colaboracao extends StatelessWidget {
  const Colaboracao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MockAtividadeColaborativa> atividades = criarMockAtividades();
    List<MockAtividadeColaborada> colaboracoes = criarMockColaboracoes();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardAtividadesColaboradas(
                colaboracoes: colaboracoes,
              ),
              const SizedBox(
                height: 10.0,
              ),
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
                padding: const EdgeInsets.only(top: 0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: atividades.length,
                itemBuilder: (BuildContext context, int index) {
                  MockAtividadeColaborativa atividade = atividades[index];
                  double espacoDisponivel =
                      MediaQuery.of(context).size.width - 22.0;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaginaAtividadeColaboracao(
                            atividade: atividade,
                          ),
                        ),
                      );
                    },
                    child: LabelDescriptionCard(
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
                                    tempoColaboracao(
                                        atividade.tempoColaboracao),
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

List<MockAtividadeColaborada> criarMockColaboracoes() {
  List<MockAtividadeColaborada> ret = [];

  for (int i = 0; i < 20; i++) {
    MockAtividadeColaborada colaboracao = MockAtividadeColaborada(
      nomeCurso: "Curso Teste " + (i % 3).toString(),
      nomeAtividade: "Colaboração " + i.toString(),
      colaboracaoEm: DateTime.now().subtract(Duration(hours: 5 * i)),
      tempoColaboracao: 10 * i,
      aprovada: i % 4 == 0,
      horasEmitidas: i % 8 == 0,
      horasRequisitadas: i % 16 == 0,
    );

    ret.add(colaboracao);
  }

  return ret;
}

class MockAtividadeColaborada {
  final String nomeCurso;
  final String nomeAtividade;
  final DateTime colaboracaoEm;
  final int tempoColaboracao;
  bool aprovada;
  bool horasEmitidas;
  bool horasRequisitadas;

  MockAtividadeColaborada({
    required this.nomeCurso,
    required this.nomeAtividade,
    required this.colaboracaoEm,
    required this.tempoColaboracao,
    required this.aprovada,
    required this.horasEmitidas,
    required this.horasRequisitadas,
  });
}

String tempoColaboracao(int minutos) {
  return formatarMinutosHoras(minutos);
}

String tempoFinalizarAtividade(DateTime fechaEm) {
  DateTime now = DateTime.now();

  return tempoEntreDatas(fechaEm, now);
}

String textoTipoAtividade(TipoAtividadeColaborativa tipo) {
  if (tipo == TipoAtividadeColaborativa.bancoDeQuestoes) {
    return "Criação";
  } else {
    return "Correção";
  }
}

List<MockAtividadeColaborativa> criarMockAtividades() {
  List<MockAtividadeColaborativa> ret = [];

  for (int i = 0; i < 20; i++) {
    MockAtividadeColaborativa atividade = MockAtividadeColaborativa(
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

class MockAtividadeColaborativa {
  final String nomeAtividade;
  final TipoAtividadeColaborativa tipoAtividadeColaborativa;
  final String? nomeMateria;
  final String nomeCurso;
  final DateTime criadoEm;
  final DateTime? respondidoEm;
  final DateTime fechaEm;
  final int tempoColaboracao;
  final List<MockQuestaoDissertativaAtividade> questoes;

  MockAtividadeColaborativa({
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
