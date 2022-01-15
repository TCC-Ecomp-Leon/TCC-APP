import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/visualizacao_curso_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/widgets/card_editavel_curso.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/widgets/card_informacoes_curso.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/formatacoes.dart';
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
  Widget buildAtividade(BuildContext context, Atividade atividade) {
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
                      child: Text(atividade.nome),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    textoParaTamanhoFixo(
                      atividade.idCurso,
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

  Widget cardRotuloAtividades(BuildContext context) {
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
                  controller.visualizarAbertas();
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
                  controller.visualizarFechadas();
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
                  controller.visualizarTodas();
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
              controller.permissaoEditar
                  ? const SizedBox(
                      width: 10.0,
                    )
                  : Container(),
              controller.permissaoEditar
                  ? InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.add,
                          color: Colors.orange,
                          size: 15.0,
                        ),
                        maxRadius: 10.0,
                        backgroundColor: Colors.amberAccent,
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Obx(
          () => RefreshListView(
            header: Column(
              children: [
                controller.permissaoEditar
                    ? CardEditavelCurso(
                        nomeCurso: controller.nomeCurso,
                        descricaoCurso: controller.descricaoCurso,
                        inicioCurso: controller.inicioCurso,
                        fimCurso: controller.fimCurso,
                        editando: controller.editandoCurso,
                        nomeCursoErro: controller.nomeCursoErro,
                        descricaoCursoErro: controller.descricaoCursoErro,
                        onChangeNomeCurso: controller.onChangeNomeCurso,
                        onChangeDesricaoCurso:
                            controller.onChangeDescricaoCurso,
                        onSelectDataInicial: controller.setInicioCurso,
                        onSelectDataFinal: controller.setFimCurso,
                        cancelarEdicao: controller.sairModoEdicaoCurso,
                        salvarEdicao: controller.salvarEdicaoCurso,
                        entrarModoEdicao: controller.entrarModoEdicaoCurso,
                        permissaoEditar: controller.permissaoEditar,
                        erro: controller.erro,
                      )
                    : CardInformacoesCurso(
                        nomeCurso: controller.curso.nome,
                        descricaoCurso: controller.curso.descricao,
                        inicioCurso: controller.curso.inicioCurso,
                        fimCurso: controller.curso.fimCurso,
                      ),
                cardRotuloAtividades(context),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            bottomOffset: controller.editandoCurso
                ? 450
                : controller.permissaoEditar
                    ? 285.0
                    : 235.0,
            child: controller.carregandoAtividades
                ? Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    child: const Loading(
                        color: Colors.white, circleTimeSeconds: 2),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0.0),
                    itemCount: controller.atividades.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildAtividade(
                          context, controller.atividades[index]);
                    },
                  ),
            refreshController: controller.refreshController,
            onRefresh: () => controller.recarregarCurso(),
          ),
        ),
      ),
    );
  }
}
