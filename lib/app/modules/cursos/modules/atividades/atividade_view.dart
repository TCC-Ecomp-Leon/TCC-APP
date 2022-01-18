import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/atividade_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/widgets/primeira_pagina_atividade.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/widgets/questao_atividade.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/widgets/ultima_pagina_atividade.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/iterable.dart';
import 'package:tcc_app/widgets/carousel_indicator.dart';
import 'package:tcc_app/widgets/loading.dart';

class AtividadeView extends GetView<AtividadeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Obx(
          () => controller.adicionandoAtividade
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child: const Loading(
                    color: Colors.white,
                    circleTimeSeconds: 2,
                  ),
                )
              : CarouselIndicator(
                  children: [
                    PrimeiraPaginaAtividade(
                      tempoColaboracao: controller.tempoColaborao,
                      assuntos: controller.assuntos,
                      onChangeTipoAtividade: controller.alterarTipoAtividade,
                      selecaoMateria: controller.selecionarMateria,
                      nome: controller.nome,
                      tipoAtividade: controller.tipoAtividade,
                      materias: controller.listaMaterias,
                      indiceMateriaSelecionada:
                          controller.indiceMateriaSelecionada,
                      editando: controller.tipoUsoController ==
                          TipoUsoControllerAtividades.Criando,
                      aberturaRespostas: controller.aberturaRespostas,
                      onSelectAberturaRespostas:
                          controller.alterarAberturaRespostas,
                      fechamentoRespostas: controller.fechamentoRespostas,
                      onSelectFechamentoRespostas:
                          controller.alterarFechamentoRespostas,
                      fechamentoCorrecoes: controller.fechamentoCorrecoes,
                      onSelectFechamentoCorrecoes:
                          controller.alterarFechamentoCorrecoes,
                    ),
                    ...controller.questoes
                        .mapIndexed(
                          (e, index) => QuestaoAtividade(
                            atribuirImagemRespostaEsperada: (imagem) =>
                                controller.setarImagemRespostaEsperada(
                                    index, imagem),
                            atribuirImagemResposta: (imagem) =>
                                controller.setarImagemResposta(index, imagem),
                            selecionarAlternativa: (selectIndex) {
                              if (controller.tipoUsoController ==
                                  TipoUsoControllerAtividades.Criando) {
                                controller.alterarAlternativaCorreta(
                                  index,
                                  selectIndex,
                                );
                              } else if (controller.tipoUsoController ==
                                  TipoUsoControllerAtividades.Respondendo) {
                                controller.selecionarRepostaAlternativa(
                                  index,
                                  selectIndex,
                                );
                              }
                            },
                            tipoAtividade: controller.tipoAtividade,
                            questao: e,
                            primeiraQuestao: index == 0,
                            ultimaQuestao:
                                index == controller.questoes.length - 1,
                            indiceQuestao: index,
                            quantidadeQuestoes: controller.questoes.length,
                            edicao: controller.tipoUsoController ==
                                    TipoUsoControllerAtividades.Criando ||
                                (controller.tipoUsoController ==
                                        TipoUsoControllerAtividades
                                            .Respondendo &&
                                    controller.tipoAtividade ==
                                        TipoAtividade.BancoDeQuestoes),
                            visualizarCorreta: controller.tipoUsoController ==
                                TipoUsoControllerAtividades.Visualizando,
                            adicionarAlternativa: () =>
                                controller.adicionarAlternativa(index),
                            removerAlternativa: (indexAlternativa) => controller
                                .removerAlternativa(index, indexAlternativa),
                            adicionarQuestao: () =>
                                controller.adicionarQuestao(),
                            removerQuestao: () =>
                                controller.removerQuestao(index),
                          ),
                        )
                        .toList(),
                    UltimaPaginaAtividade(
                      adicionarAtividade: controller.salvarAtividade,
                      nome: controller.nome,
                      tipoAtividade: controller.tipoAtividade,
                      editando: controller.tipoUsoController ==
                          TipoUsoControllerAtividades.Criando,
                      aberturaRespostas: controller.aberturaRespostas,
                      fechamentoRespostas: controller.fechamentoRespostas,
                      fechamentoCorrecoes: controller.fechamentoCorrecoes,
                      quantideDeQuestoes: controller.questoes.length,
                      erroMessage: controller.erro,
                      respondendo: controller.tipoUsoController ==
                          TipoUsoControllerAtividades.Respondendo,
                      entregarAtividade: controller.entregarAtividade,
                      sair: () => Get.back(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
