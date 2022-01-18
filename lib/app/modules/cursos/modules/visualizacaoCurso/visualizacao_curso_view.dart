import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/atividade_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/visualizacao_curso_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/widgets/card_editavel_curso.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/widgets/card_informacoes_curso.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/carousel_indicator.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

typedef OnSelectDate = void Function(DateTime date);
typedef OnFocusFunction = void Function();
typedef OnChangeTextField = void Function();

// Essa página tem que mostrar todas as informações relacionadas a um curso,
// ou seja, tanto a sua listagem de atividades quanto as suas matérias e informações
// Será implementado então uma lista lateral com a primeira e segunda views como:
//    1 - Nome do curso e listagem de atividades (botão +)
//    2 - Informações adicionais do curso e listagem de matérias (botão +)
class VisualizacaoCursoView extends GetView<VisualizacaoCursoController> {
  @override
  Widget build(BuildContext context) {
    return CarouselIndicator(
      children: [
        VisualizacaoGeralCurso(
          controller: controller,
        ),
        VisualizacaoDetalhadaCurso(
          controller: controller,
        ),
      ],
    );
  }
}

class VisualizacaoGeralCurso extends StatelessWidget {
  final VisualizacaoCursoController controller;

  const VisualizacaoGeralCurso({
    required this.controller,
    Key? key,
  }) : super(key: key);

  Widget buildCriarAtividade(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {
        await Get.toNamed(Routes.atividade, arguments: {
          'curso': controller.curso,
          'uso': TipoUsoControllerAtividades.Criando,
        });
        controller.carregarAtividades(pullRefresh: true);
      },
      child: Column(
        children: [
          Card(
            color: Colors.green,
            child: Container(
              height: 70.0,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: const Text("Adicionar atividade"),
                  ),
                  const CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.menu_book,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 3.0, color: Colors.black),
        ],
      ),
    );
  }

  Widget buildAtividade(BuildContext context, Atividade atividade) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    final DateTime referenciaTempoFechamento =
        controller.referenciaTempoFecharAtividade(atividade);
    final bool atividadeFechada =
        DateTime.now().isAfter(referenciaTempoFechamento);
    return InkWell(
      onTap: () async {
        await Get.toNamed(Routes.atividade, arguments: {
          'curso': controller.curso,
          'uso': TipoUsoControllerAtividades.Respondendo,
          'atividade': atividade,
        });
        controller.carregarAtividades(pullRefresh: true);
      },
      child: Opacity(
        opacity: atividadeFechada ? 0.5 : 1.0,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      iconeAtividade(atividade.tipoAtividade),
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Text(atividade.nome),
                    ),
                    SizedBox(
                      child: Text(
                        diaMes(
                              referenciaTempoFechamento,
                            ) +
                            "\n" +
                            horario(
                              referenciaTempoFechamento,
                            ),
                      ),
                    )
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    textoParaTamanhoFixo(
                      subtituloAtividade(atividade),
                      30,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 3.0, color: Colors.black),
          ],
        ),
      ),
    );
  }

  IconData iconeAtividade(TipoAtividade tipoAtividade) {
    if (tipoAtividade == TipoAtividade.Alternativa) {
      return Icons.list;
    } else if (tipoAtividade == TipoAtividade.Dissertativa) {
      return Icons.notes;
    } else {
      return Icons.library_books;
    }
  }

  String subtituloAtividade(Atividade atividade) {
    String texto = atividade.tipoAtividade == TipoAtividade.Alternativa
        ? "Múltilpla escolha "
        : atividade.tipoAtividade == TipoAtividade.Dissertativa
            ? "Dissertativa "
            : "Banco de questões ";
    if (atividade.idMateria != null) {
      List<Materia> materiasEncontradas = controller.materias
          .where((element) => element.id == atividade.idMateria)
          .toList();
      if (materiasEncontradas.isEmpty) {
        texto = texto + "??";
      } else {
        texto = texto + materiasEncontradas[0].nome;
      }
    }
    return texto;
  }

  Widget cardRotuloAtividades(
      BuildContext context, RefreshController refreshController) {
    return SizedBox(
      width: 350.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Atividades: ",
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {
                  controller.visualizarAbertas(refreshController);
                },
                child: Card(
                  color: controller.visualizandoAbertas
                      ? Colors.teal
                      : Colors.grey,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Abertas",
                      textScaleFactor: 0.9,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.visualizarFechadas(refreshController);
                },
                child: Card(
                  color: controller.visualizandoFechadas
                      ? Colors.teal
                      : Colors.grey,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Fechadas",
                      textScaleFactor: 0.9,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.visualizarTodas(refreshController);
                },
                child: Card(
                  color:
                      controller.visualizandoTodas ? Colors.teal : Colors.grey,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Todas",
                      textScaleFactor: 0.9,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = RefreshController();
    return Obx(
      () => Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: RefreshListView(
          header: Column(
            children: [
              controller.permissaoCriarAtividade
                  ? buildCriarAtividade(context)
                  : Container(),
              cardRotuloAtividades(context, refreshController),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
          bottomOffset: controller.permissaoCriarAtividade ? 200.0 : 110.0,
          child: controller.carregandoAtividades
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child:
                      const Loading(color: Colors.white, circleTimeSeconds: 2),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0.0),
                  itemCount: controller.atividades.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildAtividade(
                      context,
                      controller.atividades[index],
                    );
                  },
                ),
          refreshController: refreshController,
          onRefresh: () => controller.carregarAtividades(
              pullRefresh: true,
              refreshControllerAtividades: refreshController),
        ),
      )),
    );
  }
}

class VisualizacaoDetalhadaCurso extends StatelessWidget {
  final VisualizacaoCursoController controller;

  const VisualizacaoDetalhadaCurso({
    required this.controller,
    Key? key,
  }) : super(key: key);

  Widget buildMateria(BuildContext context, Materia materia) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {},
      child: Opacity(
        opacity: 1.0,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.menu_book,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Text(materia.nome),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    textoParaTamanhoFixo(
                      materia.descricao,
                      30,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 3.0, color: Colors.black),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = RefreshController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Obx(
          () => RefreshListView(
            header: Column(
              children: [
                CardEditavelCurso(
                  nomeCurso: controller.nomeCurso,
                  descricaoCurso: controller.descricaoCurso,
                  inicioCurso: controller.inicioCurso,
                  fimCurso: controller.fimCurso,
                  editando: controller.editandoCurso,
                  nomeCursoErro: controller.nomeCursoErro,
                  descricaoCursoErro: controller.descricaoCursoErro,
                  onChangeNomeCurso: controller.onChangeNomeCurso,
                  onChangeDesricaoCurso: controller.onChangeDescricaoCurso,
                  onSelectDataInicial: controller.setInicioCurso,
                  onSelectDataFinal: controller.setFimCurso,
                  cancelarEdicao: controller.sairModoEdicaoCurso,
                  salvarEdicao: controller.salvarEdicaoCurso,
                  entrarModoEdicao: controller.entrarModoEdicaoCurso,
                  permissaoEditar: controller.permissaoEditar,
                  erro: controller.erro,
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            bottomOffset: controller.permissaoEditar ? 450 : 400.0,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 0.0),
              itemCount: controller.materias.length,
              itemBuilder: (BuildContext context, int index) {
                return buildMateria(context, controller.materias[index]);
              },
            ),
            refreshController: refreshController,
            onRefresh: () => controller.recarregarCurso(
                refreshControllerCursoMaterias: refreshController),
          ),
        ),
      ),
    );
  }
}
