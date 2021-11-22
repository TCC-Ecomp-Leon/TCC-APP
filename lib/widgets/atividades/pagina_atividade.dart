import 'package:flutter/material.dart';
import 'package:tcc_app/widgets/atividades/questao/questao.dart';
import 'package:tcc_app/widgets/lateral_page_controller.dart';
import 'package:tcc_app/utils/iterable.dart';

class PaginaAtividade extends StatelessWidget {
  final TipoAtividade tipoAtividade;
  final List<Questao> questoes;
  PaginaAtividade({
    required this.tipoAtividade,
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
            (e, index) => PaginaQuestao(
                quantidadeQuestoes: questoes.length,
                indiceQuestao: index,
                tipoAtividade: tipoAtividade,
                questao: e,
                proximaQuestao: () {
                  if (index < questoes.length) {
                    _pageController.animateToPage(index + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
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
