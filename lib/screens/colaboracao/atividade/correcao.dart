import 'package:flutter/material.dart';
import 'package:tcc_app/screens/colaboracao.dart';
import 'package:tcc_app/screens/colaboracao/atividade/questao.dart';
import 'package:tcc_app/widgets/lateral_page_controller.dart';
import 'package:tcc_app/utils/iterable.dart';

class PaginaCorrecaoAtividade extends StatelessWidget {
  final List<MockQuestaoDissertativaAtividade> questoes;
  PaginaCorrecaoAtividade({
    required this.questoes,
    Key? key,
  }) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return LateralPageControllerImplementation(
      pageController: _pageController,
      children: questoes
          .mapIndexed(
            (e, index) => PaginaCorrecaoQuestao(
                funcaoNota: () {
                  double nota = 0.0;
                  // ignore: avoid_function_literals_in_foreach_calls
                  questoes.forEach((element) {
                    if (element.nota != null) {
                      nota = nota + element.nota!;
                    }
                  });
                  return nota / questoes.length;
                },
                quantidadeQuestoes: questoes.length,
                indiceQuestao: index,
                questao: e,
                proximaQuestao: () {
                  if (index < questoes.length) {
                    _pageController.animateToPage(
                      index + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  }
                },
                funcaoFinalizar: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  return true;
                }),
          )
          .toList(),
    );
  }
}

enum TipoAtividade { dissertativa, alternativa, bancoDeQuestoes }

class OpcoesQuestao {
  final String item;
  final bool? correto;
  bool? marcacao;
  OpcoesQuestao({
    required this.item,
    required this.correto,
    required this.marcacao,
  });
}

class Questao {
  final String enunciado;
  final List<OpcoesQuestao>? opcoes;
  String? resposta;

  Questao({
    required this.enunciado,
    required this.opcoes,
    required this.resposta,
  });
}
