import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/atividade_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/widgets/primeira_pagina_atividade.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/widgets/questao_atividade.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/widgets/ultima_pagina_atividade.dart';
import 'package:tcc_app/utils/iterable.dart';
import 'package:tcc_app/widgets/carousel_indicator.dart';

class AtividadeView extends GetView<AtividadeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Obx(
          () => CarouselIndicator(
            children: [
              PrimeiraPaginaAtividade(
                assuntos: controller.assuntos,
                onChangeTipoAtividade: controller.alterarTipoAtividade,
                selecaoMateria: controller.selecionarMateria,
                nome: controller.nome,
                tipoAtividade: controller.tipoAtividade,
                materias: controller.listaMaterias,
                indiceMateriaSelecionada: controller.indiceMateriaSelecionada,
                editando: true,
                aberturaRespostas: controller.aberturaRespostas,
                onSelectAberturaRespostas: controller.alterarAberturaRespostas,
                fechamentoRespostas: controller.fechamentoRespostas,
                onSelectFechamentoRespostas:
                    controller.alterarAberturaRespostas,
                fechamentoCorrecoes: controller.fechamentoCorrecoes,
                onSelectFechamentoCorrecoes:
                    controller.alterarFechamentoCorrecoes,
              ),
              ...controller.questoes
                  .mapIndexed(
                    (e, index) => QuestaoAtividade(
                      selecionarAlternativa: (selectIndex) =>
                          controller.alterarAlternativaCorreta(
                        index,
                        selectIndex,
                      ),
                      tipoAtividade: controller.tipoAtividade,
                      questao: e,
                      primeiraQuestao: index == 0,
                      ultimaQuestao: index == controller.questoes.length - 1,
                      indiceQuestao: index,
                      quantidadeQuestoes: controller.questoes.length,
                      edicao: true,
                      adicionarAlternativa: () =>
                          controller.adicionarAlternativa(index),
                      removerAlternativa: (indexAlternativa) => controller
                          .removerAlternativa(index, indexAlternativa),
                      adicionarQuestao: () => controller.adicionarQuestao(),
                      removerQuestao: () => controller.removerQuestao(index),
                    ),
                  )
                  .toList(),
              UltimaPaginaAtividade(
                nome: controller.nome,
                tipoAtividade: controller.tipoAtividade,
                editando: true,
                aberturaRespostas: controller.aberturaRespostas,
                fechamentoRespostas: controller.fechamentoRespostas,
                fechamentoCorrecoes: controller.fechamentoCorrecoes,
                quantideDeQuestoes: controller.questoes.length,
                erroMessage: controller.erro,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
