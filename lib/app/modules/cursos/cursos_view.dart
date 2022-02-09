import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/cursos/cursos_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

class CursosView extends GetView<CursosController> {
  const CursosView({Key? key}) : super(key: key);

  Widget buildCriarCurso(
    BuildContext context,
    RefreshController refreshController,
  ) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {
        await Get.toNamed(Routes.criacaoCurso, arguments: controller.projeto);
        controller.carregarListaCursos(
          refreshController: refreshController,
          force: true,
        );
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
                    child: const Text("Adicionar curso"),
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

  Widget buildCurso(
    BuildContext context,
    Curso curso,
    RefreshController refreshController,
  ) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {
        await Get.toNamed(Routes.visualizacaoCurso, arguments: curso);
        controller.carregarListaCursos(
          refreshController: refreshController,
          force: true,
        );
      },
      child: Opacity(
        opacity: DateTime.now().isAfter(curso.fimCurso) ? 0.5 : 1.0,
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
                      child: Text(curso.nome),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    textoParaTamanhoFixo(
                      curso.descricao,
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
    return BottomMenuView(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 5.0, right: 5.0),
          child: Obx(
            () => controller.carregandoCursos
                ? Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    child: const Loading(
                        color: Colors.white, circleTimeSeconds: 2),
                  )
                : RefreshListView(
                    header: controller.regraProjeto
                        ? buildCriarCurso(
                            context,
                            refreshController,
                          )
                        : const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Seus cursos",
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ),
                    bottomOffset: controller.regraProjeto ? 170.0 : 135.0,
                    refreshController: refreshController,
                    onRefresh: () {
                      controller.carregarListaCursos(
                        refreshController: refreshController,
                        force: true,
                      );
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 0.0),
                      itemCount: controller.cursos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildCurso(
                          context,
                          controller.cursos[index],
                          refreshController,
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
      controller: controller,
    );
  }
}
