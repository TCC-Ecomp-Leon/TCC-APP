import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/cursos/cursos_controller.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/screens/dummy.dart';
import 'package:tcc_app/widgets/loading.dart';

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
                        Icons.library_books,
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
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
          child: ListView(
            padding: const EdgeInsets.only(top: 0.0),
            shrinkWrap: true,
            children: [
              buildCriarMateria(context),
              Obx(
                () => SizedBox(
                  height: MediaQuery.of(context).size.height - 170.0,
                  child: controller.carregandoCursos
                      ? Container(
                          alignment: Alignment.center,
                          height: 100.0,
                          child: const Loading(
                              color: Colors.white, circleTimeSeconds: 2),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.cursos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildCurso(
                              context,
                              controller.cursos[index],
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      controller: controller,
    );
  }
}
