import 'package:flutter/material.dart';
import 'package:tcc_app/screens/colaboracao/atividade/correcao.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';
import 'package:tcc_app/widgets/expanded_list.dart';

class DashboardAtividade extends StatelessWidget {
  const DashboardAtividade({Key? key}) : super(key: key);

  Widget nomeCampo(String campo) {
    return Text(
      campo,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget valorCampo(String valor) {
    return Text(
      valor,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.end,
    );
  }

  Widget informacoesDuasColunasFixas(
    BuildContext context, {
    required String campo,
    required String valor,
    bool aoContrario = false,
  }) {
    double width = MediaQuery.of(context).size.width - 90.0;
    double divisao1 = width * 0.3;
    double divisao2 = width * 0.7;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: aoContrario ? divisao2 : divisao1,
          child: nomeCampo(campo),
        ),
        SizedBox(
          width: aoContrario ? divisao1 : divisao2,
          child: valorCampo(valor),
        ),
      ],
    );
  }

  Widget buildCard(
    Widget child, {
    Alignment alignment = Alignment.centerLeft,
    Color? cardColor,
  }) {
    return Card(
      color: cardColor,
      child: Container(
        height: 50.0,
        alignment: alignment,
        padding: const EdgeInsets.all(5.0),
        child: child,
      ),
    );
  }

  String getNomeAluno(String idAluno, List<DashboardMockAluno> alunos) {
    List<DashboardMockAluno> filtro =
        alunos.where((element) => element.idAluno == idAluno).toList();
    if (filtro.isNotEmpty) {
      return filtro.first.nomeAluno;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    DashboardMockAtividade mockAtividade = criarMockAtividadeDashboard();
    List<DashboardMockAluno> alunos = criarDashboardMockAlunos();

    List<String> alunosResponderam =
        mockAtividade.respostas.map((e) => e.idAluno).toList();
    List<DashboardMockAluno> alunosQueAindaNaoResponderam = alunos
        .where((aluno) => !alunosResponderam.contains(aluno.idAluno))
        .toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            CardOverlapTitle(
              title: "Atividade",
              children: [
                nomeCampo("Nome Atividade: "),
                valorCampo(mockAtividade.nomeAtividade),
                const SizedBox(
                  height: 5.0,
                ),
                nomeCampo("Curso: "),
                valorCampo(mockAtividade.nomeCurso),
                const SizedBox(
                  height: 5.0,
                ),
                informacoesDuasColunasFixas(
                  context,
                  campo: "Data criado: ",
                  valor: diaComAno(mockAtividade.criacao),
                  aoContrario: true,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                informacoesDuasColunasFixas(
                  context,
                  campo: "Data fechamento respostas: ",
                  valor: diaComAno(mockAtividade.fechamentoRespostas),
                  aoContrario: true,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                (mockAtividade.fechamentoCorrecoes != null &&
                        mockAtividade.tempoColaboracao != null)
                    ? Column(
                        children: [
                          informacoesDuasColunasFixas(
                            context,
                            campo: "Fechamento colaboração: ",
                            valor:
                                diaComAno(mockAtividade.fechamentoCorrecoes!),
                            aoContrario: true,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          informacoesDuasColunasFixas(
                            context,
                            campo: "Tempo colaboração: ",
                            valor: formatarMinutosHoras(
                                mockAtividade.tempoColaboracao!),
                            aoContrario: true,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 320.0,
              child: ListView(
                children: [
                  ExpandedList(
                    expanded: false,
                    labelTitle: (expanded) {
                      return buildCard(
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            !expanded
                                ? "Alunos que ainda não responderam (" +
                                    alunosQueAindaNaoResponderam.length
                                        .toString() +
                                    ")"
                                : "Alunos que ainda não responderam",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        cardColor: Colors.white,
                        alignment: Alignment.center,
                      );
                    },
                    render: (expanded) {
                      if (!expanded) {
                        return Container();
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: alunosQueAindaNaoResponderam.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildCard(
                            Text(
                              alunosQueAindaNaoResponderam[index].nomeAluno,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  ExpandedList(
                    expanded: false,
                    labelTitle: (expanded) {
                      return buildCard(
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            !expanded
                                ? "Respostas (" +
                                    mockAtividade.respostas.length.toString() +
                                    ")"
                                : "Respostas",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        cardColor: Colors.white,
                        alignment: Alignment.center,
                      );
                    },
                    render: (expanded) {
                      if (!expanded) {
                        return Container();
                      }
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: mockAtividade.respostas.length,
                        itemBuilder: (BuildContext context, int index) {
                          DashboardMockAtividadeRespondida resposta =
                              mockAtividade.respostas[index];
                          return buildCard(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Aluno: " +
                                      getNomeAluno(resposta.idAluno, alunos),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(resposta.revisaoRequisitada
                                        ? "Revisar"
                                        : resposta.corrigida
                                            ? "Corrigida"
                                            : "Pendente"),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    resposta.nota != null
                                        ? Text(resposta.nota.toStringAsFixed(2))
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: buildCard(
                      const Text("Relatório"),
                      cardColor: Colors.green,
                      alignment: Alignment.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DashboardMockAtividade criarMockAtividadeDashboard() {
  return DashboardMockAtividade(
    nomeAtividade: "Atividade Mockada",
    tipoAtividade: TipoAtividade.alternativa,
    nomeCurso: "Curso Mockado",
    tempoColaboracao: 5,
    criacao: DateTime.now().subtract(
      const Duration(
        days: 30,
      ),
    ),
    fechamentoCorrecoes: DateTime.now().subtract(
      const Duration(
        days: 15,
      ),
    ),
    aberturaRespostas: DateTime.now(),
    fechamentoRespostas: DateTime.now().add(
      const Duration(
        days: 10,
      ),
    ),
    respostas: criarDashboardMockRespostas(),
  );
}

List<DashboardMockAtividadeRespondida> criarDashboardMockRespostas() {
  List<DashboardMockAtividadeRespondida> ret = [];

  for (int i = 0; i < 10; i++) {
    DashboardMockAtividadeRespondida respondida =
        DashboardMockAtividadeRespondida(
      idAluno: i.toString(),
      corrigida: i % 2 == 0,
      nota: 10 - 0.25 * i,
      revisaoRequisitada: i % 4 == 0,
    );

    ret.add(respondida);
  }

  return ret;
}

List<DashboardMockAluno> criarDashboardMockAlunos() {
  List<DashboardMockAluno> ret = [];

  for (int i = 0; i < 20; i++) {
    DashboardMockAluno aluno = DashboardMockAluno(
      idAluno: (i + 5).toString(),
      nomeAluno: "Aluno " + i.toString(),
    );

    ret.add(aluno);
  }

  return ret;
}

class DashboardMockAtividade {
  final String nomeAtividade;
  final TipoAtividade tipoAtividade;
  final String nomeCurso;
  final int? tempoColaboracao;
  final DateTime criacao;
  final DateTime aberturaRespostas;
  final DateTime fechamentoRespostas;
  final DateTime? fechamentoCorrecoes;
  final List<DashboardMockAtividadeRespondida> respostas;

  DashboardMockAtividade({
    required this.nomeAtividade,
    required this.tipoAtividade,
    required this.nomeCurso,
    required this.tempoColaboracao,
    required this.criacao,
    required this.fechamentoCorrecoes,
    required this.aberturaRespostas,
    required this.fechamentoRespostas,
    required this.respostas,
  });
}

class DashboardMockAtividadeRespondida {
  final String idAluno;
  final bool corrigida;
  final double nota;
  final bool revisaoRequisitada;

  DashboardMockAtividadeRespondida({
    required this.idAluno,
    required this.corrigida,
    required this.nota,
    required this.revisaoRequisitada,
  });
}

class DashboardMockAluno {
  final String idAluno;
  final String nomeAluno;

  DashboardMockAluno({
    required this.idAluno,
    required this.nomeAluno,
  });
}
