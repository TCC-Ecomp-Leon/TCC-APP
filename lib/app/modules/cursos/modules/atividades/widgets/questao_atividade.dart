import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/widgets/child_radio_card.dart';
import 'package:tcc_app/widgets/input_card_image_text.dart';

import '../atividade_controller.dart';

typedef ControllerActions = void Function();
typedef ControllerIndexedActions = void Function(int indexAlternativa);

class QuestaoAtividade extends StatelessWidget {
  TipoAtividade tipoAtividade;
  InformacoesQuestoes questao;
  bool primeiraQuestao;
  bool ultimaQuestao;
  int indiceQuestao;
  int quantidadeQuestoes;
  bool edicao;
  ControllerActions adicionarAlternativa;
  ControllerIndexedActions removerAlternativa;
  ControllerActions adicionarQuestao;
  ControllerActions removerQuestao;

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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        right: 50.0,
        left: 50.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headerQuestao(),
            tipoAtividade == TipoAtividade.Alternativa
                ? buildAlternativas()
                : Container(),
            edicao && tipoAtividade == TipoAtividade.Alternativa
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
                : Container(),
            tipoAtividade == TipoAtividade.Dissertativa
                ? buildEntradaResposta(
                    questao.textoRespostaEsperada,
                    questao.imagemRespostaEsperada,
                  )
                : Container(),
            const SizedBox(
              height: 20.0,
            ),
            Column(
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
            ),
          ],
        ),
      ),
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
                      maxLines: 5,
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
      padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        itemCount: questao.alternativas.length,
        itemBuilder: (BuildContext context, int index) {
          return ChildRadioCard(
            correctOption: edicao ? null : questao.alternativaCorreta,
            cardSelectedColor: Colors.blue,
            cardColor: Colors.white,
            index: index,
            selectedIndex: edicao ? questao.alternativaCorreta : 0,
            child: !edicao
                ? Text(questao.alternativas[index].text)
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
            onChange: (index) {},
          );
        },
      ),
    );
  }

  Widget buildEntradaResposta(
      TextEditingController keyboardInput, String? img) {
    return InputCardImageText(
      input: img,
      textEditingController: keyboardInput,
    );
  }
}
