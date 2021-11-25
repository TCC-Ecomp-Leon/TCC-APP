import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tcc_app/screens/colaboracao.dart';
import 'package:tcc_app/widgets/input_card_image_text.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

typedef FuncaoProximaQuestao = void Function();
typedef FuncaoFinalizar = Future<bool> Function();
typedef FuncaoNota = double Function();

class PaginaCorrecaoQuestao extends StatefulWidget {
  final int quantidadeQuestoes;
  final int indiceQuestao;
  final MockQuestaoDissertativaAtividade questao;
  final FuncaoProximaQuestao proximaQuestao;
  final FuncaoFinalizar funcaoFinalizar;
  final FuncaoNota funcaoNota;

  const PaginaCorrecaoQuestao({
    required this.quantidadeQuestoes,
    required this.indiceQuestao,
    required this.questao,
    required this.proximaQuestao,
    required this.funcaoFinalizar,
    required this.funcaoNota,
    Key? key,
  }) : super(key: key);

  @override
  State<PaginaCorrecaoQuestao> createState() => _PaginaCorrecaoQuestaoState();
}

class _PaginaCorrecaoQuestaoState extends State<PaginaCorrecaoQuestao> {
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
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
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            (widget.indiceQuestao + 1)
                                                .toString(),
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
                                        style: const TextStyle(
                                            color: Colors.black),
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
                                    widget.funcaoNota().toStringAsFixed(2),
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
                        InputCardImageText(
                          input: widget.questao.resposta,
                          textEditingController: null,
                          visibleInputSelector: false,
                        ),
                        InputCardImageText(
                          input: null,
                          textEditingController: TextEditingController(),
                          labelText: "Comentários",
                          hintText: "Insira os comentários sobre a resolução",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        RatingBar.builder(
                          glow: false,
                          initialRating: 0,
                          minRating: 0,
                          maxRating: 10,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              widget.questao.nota = (2 * rating).toInt();
                            });
                          },
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 60.0,
                              child: Text("Nota: ", textAlign: TextAlign.start),
                            ),
                            SizedBox(
                              width: 60.0,
                              child: Text(
                                widget.questao.nota != null
                                    ? widget.questao.nota!.toString()
                                    : "0",
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
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
      ),
    );
  }
}
