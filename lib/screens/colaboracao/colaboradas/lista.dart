import 'package:flutter/material.dart';
import 'package:tcc_app/screens/colaboracao.dart';
import 'package:tcc_app/screens/colaboracao/card_colaboradas.dart';
import 'package:tcc_app/screens/colaboracao/pagina_atividade.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';
import 'package:tcc_app/widgets/label_description_card.dart';

class ListaColaboracoes extends StatefulWidget {
  final List<MockAtividadeColaborada> colaboracoes;

  const ListaColaboracoes({
    required this.colaboracoes,
    Key? key,
  }) : super(key: key);

  @override
  State<ListaColaboracoes> createState() => _ListaColaboracoesState();
}

class _ListaColaboracoesState extends State<ListaColaboracoes> {
  bool requisitando = false;

  Map<MockAtividadeColaborada, bool> requisicoes = {};

  @override
  initState() {
    super.initState();
  }

  int get quantidadeRequisitando {
    List<MockAtividadeColaborada> _requisicoes = requisicoes.keys.toList();
    if (_requisicoes.isEmpty) return 0;
    return _requisicoes
        .map((e) => (requisicoes[e] ?? false) ? 1 : 0)
        .reduce((value, element) => value + element);
  }

  int get horasRequisitando {
    List<MockAtividadeColaborada> _requisicoes = requisicoes.keys.toList();
    if (_requisicoes.isEmpty) return 0;
    return _requisicoes
        .map((e) => (requisicoes[e] ?? false) ? e.tempoColaboracao : 0)
        .reduce((value, element) => value + element)
        .toInt();
  }

  Widget iconeStatus(MockAtividadeColaborada colaboracao) {
    final bool value =
        requisicoes[colaboracao] ?? colaboracao.horasRequisitadas;
    if (requisitando && colaboracao.aprovada) {
      return IconButton(
        splashRadius: 10.0,
        padding: const EdgeInsets.all(0.0),
        iconSize: 20.0,
        color: Colors.green,
        onPressed: () {
          setState(() {
            requisicoes[colaboracao] = !value;
          });
        },
        icon: Icon(
          value ? Icons.check_box_outlined : Icons.check_box_outline_blank,
        ),
      );
    }
    return IconButton(
      splashRadius: 10.0,
      padding: const EdgeInsets.all(0.0),
      iconSize: 20.0,
      onPressed: () {},
      icon: Icon(
        !colaboracao.aprovada
            ? Icons.pending
            : colaboracao.horasRequisitadas
                ? Icons.hourglass_top
                : Icons.check_circle,
        color: !colaboracao.aprovada
            ? Colors.orangeAccent
            : colaboracao.horasRequisitadas
                ? Colors.blue
                : Colors.green,
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              requisitando
                  ? CardOverlapTitle(
                      title: "Informações da requisição",
                      children: [
                        informacoesDuasColunasFixas(
                          context,
                          campo: "Quantidade de atividades: ",
                          valor: quantidadeRequisitando.toString(),
                          aoContrario: true,
                        ),
                        informacoesDuasColunasFixas(
                          context,
                          campo: "Horas: ",
                          valor: formatarMinutosHoras(
                            horasRequisitando,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              requisitando
                  ? const SizedBox(
                      height: 10.0,
                    )
                  : Container(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Lista de atividades que colaborou",
                        textScaleFactor: 1.3,
                      ),
                    ],
                  ),
                ),
              ),
              requisitando
                  ? TextButton(
                      onPressed: () {},
                      child: const Text("Requisitar"),
                      style: TextButton.styleFrom(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                        textStyle: const TextStyle(fontSize: 20.0),
                      ),
                    )
                  : Container(),
              requisitando
                  ? const SizedBox(
                      height: 10.0,
                    )
                  : Container(),
              TextButton(
                onPressed: () {
                  setState(() {
                    requisitando = !requisitando;
                  });
                },
                child: Text(!requisitando ? "Requisitar horas" : "Cancelar"),
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.white,
                  backgroundColor: requisitando ? Colors.red : Colors.teal,
                  onSurface: Colors.grey,
                  textStyle: const TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.colaboracoes.length,
                itemBuilder: (BuildContext context, int index) {
                  MockAtividadeColaborada colaboracao =
                      widget.colaboracoes[index];
                  double espacoDisponivel =
                      MediaQuery.of(context).size.width - 22.0;
                  return LabelDescriptionCard(
                    value: LabelDescriptionCardProps(
                      label: colaboracao.nomeAtividade,
                      mainWidgetRow: iconeStatus(colaboracao),
                      description: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: espacoDisponivel * 0.33,
                            child: Text(
                              "Dia: " + diaComAno(colaboracao.colaboracaoEm),
                              textScaleFactor: 0.6,
                            ),
                          ),
                          SizedBox(
                            width: espacoDisponivel * 0.33,
                            child: Text(
                              "Curso: " + colaboracao.nomeCurso,
                              textScaleFactor: 0.6,
                            ),
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
                                    colaboracao.tempoColaboracao,
                                  ),
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
