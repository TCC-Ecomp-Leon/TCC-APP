import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/widgets/child_radio_card.dart';
import 'package:tcc_app/widgets/input_card_image_text.dart';

import '../atividade_controller.dart';

typedef ControllerActions = void Function();
typedef ControllerIndexedActions = void Function(int indexAlternativa);
typedef ControllerTextActions = void Function(String value);
typedef ControllerDoubleValueActions = void Function(double value);

// ignore: must_be_immutable
class QuestaoAtividade extends StatelessWidget {
  TipoAtividade tipoAtividade;
  InformacoesQuestoes questao;
  bool primeiraQuestao;
  bool ultimaQuestao;
  int indiceQuestao;
  int quantidadeQuestoes;
  bool edicao;
  bool visualizarCorreta;
  ControllerActions adicionarAlternativa;
  ControllerIndexedActions removerAlternativa;
  ControllerActions adicionarQuestao;
  ControllerActions removerQuestao;
  ControllerIndexedActions selecionarAlternativa;
  ControllerTextActions atribuirImagemRespostaEsperada;
  ControllerTextActions atribuirImagemResposta;
  ControllerDoubleValueActions atribuirNotaQuestao;

  bool respondida;
  bool corrigida;

  QuestaoAtividade({
    required this.tipoAtividade,
    required this.questao,
    required this.primeiraQuestao,
    required this.ultimaQuestao,
    required this.indiceQuestao,
    required this.quantidadeQuestoes,
    required this.edicao,
    required this.adicionarAlternativa,
    required this.removerAlternativa,
    required this.adicionarQuestao,
    required this.removerQuestao,
    required this.selecionarAlternativa,
    required this.atribuirImagemRespostaEsperada,
    required this.visualizarCorreta,
    required this.atribuirImagemResposta,
    required this.respondida,
    required this.corrigida,
    required this.atribuirNotaQuestao,
    Key? key,
  }) : super(key: key);

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        right: 50.0,
        left: 50.0,
      ),
      child: SingleChildScrollView(
          controller: scrollController,
          child: KeyboardVisibilityBuilder(
            builder: (BuildContext context, bool visible) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerQuestao(),
                  bodyQuestao(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  edicao ? buildActions() : Container(),
                  visible
                      ? const SizedBox(
                          height: 170.0,
                        )
                      : Container(),
                ],
              );
            },
          )),
    );
  }

  Widget buildActions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: removerQuestao,
          child: const Text(
            "Remover questão",
            textScaleFactor: 0.9,
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            primary: Colors.white,
            backgroundColor: Colors.red,
            onSurface: Colors.grey,
            textStyle: const TextStyle(fontSize: 17.0),
          ),
        ),
        TextButton(
          onPressed: adicionarQuestao,
          child: const Text(
            "Nova questão",
            textScaleFactor: 0.9,
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            primary: Colors.white,
            backgroundColor: Colors.green,
            onSurface: Colors.grey,
            textStyle: const TextStyle(fontSize: 17.0),
          ),
        ),
      ],
    );
  }

  Widget bodyQuestao() {
    return tipoAtividade != TipoAtividade.Dissertativa
        ? buildBodyAlternativas()
        : buildBodyDissertativa();
  }

  Widget buildBodyAlternativas() {
    return Column(
      children: [
        buildAlternativas(),
        edicao
            ? TextButton(
                onPressed: adicionarAlternativa,
                child: const Text(
                  "Nova opção",
                  textScaleFactor: 0.9,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                  textStyle: const TextStyle(fontSize: 17.0),
                ),
              )
            : Container()
      ],
    );
  }

  Widget buildBodyDissertativa() {
    return edicao
        ? buildEntradaResposta(
            questao.textoRespostaEsperada,
            questao.imagemRespostaEsperada,
            "Resposta esperada:",
            atribuirImagemRespostaEsperada,
            true,
            true,
          )
        : respondida
            ? Column(
                children: [
                  buildEntradaResposta(
                    questao.textoRespostaEsperada,
                    questao.imagemRespostaEsperada,
                    "Resposta esperada:",
                    (imagem) {},
                    false,
                    false,
                  ),
                  buildEntradaResposta(
                    questao.textoRespostaInserida,
                    questao.imagemRespostaInserida,
                    "Resposta inserida:",
                    (imagem) {},
                    false,
                    false,
                  ),
                  buildEntradaResposta(
                    questao.comentarioCorrecao,
                    null,
                    "Comentário:",
                    (imagem) {},
                    false,
                    !corrigida,
                  ),
                  buildNota(),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              )
            : buildEntradaResposta(
                questao.textoRespostaInserida,
                questao.imagemRespostaInserida,
                "Resposta:",
                atribuirImagemResposta,
                true,
                true,
              );
  }

  Widget widgetQuestaoAnteriorEProxima() {
    int index = indiceQuestao;
    String? indiceAnterior = index > 0 ? index.toString() : null;
    String? indiceProxima =
        index < quantidadeQuestoes ? (index + 1).toString() : null;
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
              percent: index / quantidadeQuestoes,
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
              percent: (index + 1) / quantidadeQuestoes,
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

  Widget headerQuestao() {
    return Stack(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Questão ",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        (indiceQuestao + 1).toString(),
                        textScaleFactor: 1.2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " / " + quantidadeQuestoes.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  // Text(
                  //   questao.enunciado.text,
                  //   textAlign: TextAlign.justify,
                  //   style: const TextStyle(color: Colors.black),
                  // ),
                  SizedBox(
                    child: TextField(
                      readOnly: !edicao,
                      controller: questao.enunciado,
                      decoration: const InputDecoration(
                        hintText: "Enunciado",
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.black),
                      maxLines: respondida && !corrigida ? 3 : 5,
                    ),
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
              percent: (indiceQuestao + 1) / quantidadeQuestoes,
              center: Text(
                (indiceQuestao + 1).toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                textScaleFactor: 0.8,
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),
          ],
        )
      ],
    );
  }

  Widget buildAlternativas() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        itemCount: questao.alternativas.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                child: ChildRadioCard(
                  correctOption: edicao
                      ? null
                      : visualizarCorreta
                          ? questao.alternativaCorreta
                          : null,
                  cardSelectedColor: Colors.blue,
                  cardColor: Colors.white,
                  index: index,
                  selectedIndex: edicao
                      ? questao.alternativaCorreta
                      : questao.alternativaSelecionada,
                  child: !edicao
                      ? Text(
                          questao.alternativas[index].text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        )
                      : SizedBox(
                          child: TextField(
                            controller: questao.alternativas[index],
                            decoration: const InputDecoration(
                              fillColor: Colors.black,
                              hintText: "Opção",
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                            maxLines: 1,
                          ),
                        ),
                  onChange: selecionarAlternativa,
                ),
              ),
              edicao
                  ? Container(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: InkWell(
                        onTap: () {
                          removerAlternativa(index);
                        },
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          backgroundColor: Colors.teal,
                          maxRadius: 12.0,
                        ),
                      ))
                  : Container()
            ],
          );
        },
      ),
    );
  }

  Widget buildNota() {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        AbsorbPointer(
          absorbing: corrigida,
          child: RatingBar.builder(
            glow: false,
            initialRating: questao.notaCorrecao / 2,
            minRating: 0,
            maxRating: 5,
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
              atribuirNotaQuestao(2 * rating);
            },
          ),
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
                questao.notaCorrecao.toStringAsFixed(2),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildEntradaResposta(
    TextEditingController keyboardInput,
    String? img,
    String labelText,
    ControllerTextActions onSelectImage,
    bool trocarTipoEntrada,
    bool editavel,
  ) {
    return InputCardImageText(
      input: img,
      textEditingController: keyboardInput,
      labelText: labelText,
      onSelectImage: onSelectImage,
      visibleInputSelector: trocarTipoEntrada,
      enabled: editavel,
      maxLines: respondida && !corrigida ? 3 : 5,
    );
  }
}
