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
  const AtividadeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Obx(
          () => controller.adicionandoAtividade ||
                  controller.respondendoAtividade ||
                  controller.corrigindoAtividade
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
                      corrigida: controller.corrigida,
                      notaAtividade: controller.notaAtividade,
                      jaRespondida: controller.resposta != null,
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
                          TipoUsoControllerAtividades.criando,
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
                            atribuirNotaQuestao: (nota) =>
                                controller.atribuirNotaQuestao(index, nota),
                            respondida: controller.resposta != null,
                            corrigida: controller.corrigida,
                            atribuirImagemRespostaEsperada: (imagem) =>
                                controller.setarImagemRespostaEsperada(
                                    index, imagem),
                            atribuirImagemResposta: (imagem) =>
                                controller.setarImagemResposta(index, imagem),
                            selecionarAlternativa: (selectIndex) {
                              if (controller.tipoUsoController ==
                                  TipoUsoControllerAtividades.criando) {
                                controller.alterarAlternativaCorreta(
                                  index,
                                  selectIndex,
                                );
                              } else if (controller.tipoUsoController ==
                                  TipoUsoControllerAtividades.respondendo) {
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
                                    TipoUsoControllerAtividades.criando ||
                                (controller.tipoUsoController ==
                                        TipoUsoControllerAtividades
                                            .respondendo &&
                                    controller.tipoAtividade ==
                                        TipoAtividade.BancoDeQuestoes),
                            visualizarCorreta: controller.tipoUsoController ==
                                TipoUsoControllerAtividades.visualizando,
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
                      corrigir: controller.corrigirAtividade,
                      corrigindo:
                          !controller.corrigida && controller.resposta != null,
                      adicionarAtividade: controller.salvarAtividade,
                      nome: controller.nome,
                      tipoAtividade: controller.tipoAtividade,
                      editando: controller.tipoUsoController ==
                          TipoUsoControllerAtividades.criando,
                      aberturaRespostas: controller.aberturaRespostas,
                      fechamentoRespostas: controller.fechamentoRespostas,
                      fechamentoCorrecoes: controller.fechamentoCorrecoes,
                      quantideDeQuestoes: controller.questoes.length,
                      erroMessage: controller.erro,
                      respondendo: controller.tipoUsoController ==
                          TipoUsoControllerAtividades.respondendo,
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
