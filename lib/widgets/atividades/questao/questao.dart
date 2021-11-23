import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tcc_app/widgets/atividades/pagina_atividade.dart';
import 'package:tcc_app/widgets/input_card_image_text.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/radio_card.dart';

typedef FuncaoProximaQuestao = void Function();
typedef FuncaoFinalizar = Future<bool> Function();

class PaginaQuestao extends StatefulWidget {
  final int quantidadeQuestoes;
  final int indiceQuestao;
  final TipoAtividade tipoAtividade;
  final Questao questao;
  final FuncaoProximaQuestao proximaQuestao;
  final FuncaoFinalizar funcaoFinalizar;

  const PaginaQuestao({
    required this.quantidadeQuestoes,
    required this.indiceQuestao,
    required this.tipoAtividade,
    required this.questao,
    required this.proximaQuestao,
    required this.funcaoFinalizar,
    Key? key,
  }) : super(key: key);

  @override
  State<PaginaQuestao> createState() => _PaginaQuestaoState();
}

class _PaginaQuestaoState extends State<PaginaQuestao> {
  Widget widgetQuestaoAnteriorEProxima() {
    int index = widget.indiceQuestao;
    String? indiceAnterior = index > 0 ? index.toString() : null;
    String? indiceProxima =
        index < widget.quantidadeQuestoes ? (index + 1).toString() : null;
    if (indiceAnterior != null) {
      while (indiceAnterior!.length < 2) {
        indiceAnterior = "0" + indiceAnterior;
      }
    }
    if (indiceProxima != null) {
      while (indiceProxima!.length < 2) {
        indiceProxima = "0" + indiceProxima;
      }
    }

    List<Widget> children = [];
    if (indiceAnterior != null) {
      children.add(
        Row(
          children: [
            Text(
              indiceAnterior,
              textScaleFactor: 0.7,
              style: const TextStyle(color: Colors.black),
            ),
            LinearPercentIndicator(
              width: 50.0,
              lineHeight: 8.0,
              percent: (index) / widget.quantidadeQuestoes,
              progressColor: Colors.green,
            )
          ],
        ),
      );
    } else {
      children.add(Container());
    }
    if (indiceProxima != null) {
      children.add(
        Row(
          children: [
            LinearPercentIndicator(
              width: 50.0,
              lineHeight: 8.0,
              percent: (index + 1) / widget.quantidadeQuestoes,
              progressColor: Colors.red,
            ),
            Text(
              indiceProxima,
              textScaleFactor: 0.7,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
    } else {
      children.add(Container());
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  int get selectedIndex {
    if (widget.questao.opcoes != null) {
      for (int i = 0; i < widget.questao.opcoes!.length; i++) {
        bool marcacao = widget.questao.opcoes![i].marcacao ?? false;
        if (marcacao) {
          return i;
        }
      }
    }
    return -1;
  }

  int? get correctOption {
    if (widget.questao.opcoes != null) {
      for (int i = 0; i < widget.questao.opcoes!.length; i++) {
        bool correta = widget.questao.opcoes![i].correto ?? false;
        if (correta) {
          return i;
        }
      }
    }
    return null;
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: loading
            ? const Loading(circleTimeSeconds: 1, color: Colors.green)
            : Padding(
                padding: const EdgeInsets.only(
                  right: 30.0,
                  left: 30.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    widgetQuestaoAnteriorEProxima(),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Questão ",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          (widget.indiceQuestao + 1).toString(),
                                          textScaleFactor: 1.2,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " / " +
                                              widget.quantidadeQuestoes
                                                  .toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      widget.questao.enunciado,
                                      textAlign: TextAlign.justify,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.white,
                              ),
                              CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 10.0,
                                animation: true,
                                percent: (widget.indiceQuestao + 1) /
                                    widget.quantidadeQuestoes,
                                center: Text(
                                  (widget.indiceQuestao + 1).toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textScaleFactor: 0.8,
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.purple,
                              ),
                            ],
                          )
                        ],
                      ),
                      widget.questao.opcoes != null
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 15.0, right: 15.0),
                              child: ListView.builder(
                                padding: const EdgeInsets.only(
                                  top: 0.0,
                                ),
                                shrinkWrap: true,
                                itemCount: widget.questao.opcoes!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  OpcoesQuestao opcoesQuestao =
                                      widget.questao.opcoes![index];
                                  return RadioCard(
                                    correctOption: correctOption,
                                    cardSelectedColor: Colors.blue,
                                    cardColor: Colors.white,
                                    index: index,
                                    selectedIndex: selectedIndex,
                                    text: opcoesQuestao.item,
                                    onChange: (index) {
                                      if (correctOption != null) return;
                                      // ignore: avoid_function_literals_in_foreach_calls
                                      widget.questao.opcoes!.forEach((opcao) {
                                        opcao.marcacao = false;
                                      });
                                      setState(() {
                                        opcoesQuestao.marcacao = true;
                                      });
                                    },
                                  );
                                },
                              ),
                            )
                          : InputCardImageText(
                              input: widget.questao.resposta,
                              textEditingController:
                                  widget.questao.resposta == null
                                      ? TextEditingController()
                                      : null,
                            ),
                      TextButton(
                        onPressed: () async {
                          if (widget.indiceQuestao <
                              widget.quantidadeQuestoes - 1) {
                            widget.proximaQuestao();
                          } else {
                            setState(() {
                              loading = true;
                            });
                            bool result = await widget.funcaoFinalizar();
                            if (!result) {
                              setState(() {
                                loading = false;
                              });
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          widget.indiceQuestao < widget.quantidadeQuestoes - 1
                              ? "PRÓXIMA"
                              : "TERMINAR",
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(7.0),
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          onSurface: Colors.grey,
                          textStyle: const TextStyle(fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
