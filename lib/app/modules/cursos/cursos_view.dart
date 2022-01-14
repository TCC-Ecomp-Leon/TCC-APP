import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/cursos/cursos_controller.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/screens/dummy.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

class CursosView extends GetView<CursosController> {
  Widget buildCriarMateria(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {},
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
                    child: const Text("Adicionar matéria"),
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

  Widget buildCurso(BuildContext context, Curso curso) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {},
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
    return BottomMenuView(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
            child: RefreshListView(
              header: buildCriarMateria(context),
              bottomOffset: 170.0,
              refreshController: controller.refreshController,
              onRefresh: () {
                controller.carregarListaCursos(notSilent: true, force: true);
              },
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 0.0),
                itemCount: controller.cursos.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCurso(
                    context,
                    controller.cursos[index],
                  );
                },
              ),
            )),
      ),
      controller: controller,
    );
  }
}
