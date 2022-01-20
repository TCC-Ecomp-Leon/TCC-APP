import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/colaboracao/colaboracao_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/screens/dummy.dart';
import 'package:tcc_app/widgets/carousel_indicator.dart';
import 'package:tcc_app/widgets/icon_label_description_card.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

class ColaboracaoView extends GetView<ColaboracaoController> {
  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 10.0,
          right: 10.0,
        ),
        child: CarouselIndicator(
          children: [
            Obx(
              () => controller.carregando
                  ? Container(
                      alignment: Alignment.center,
                      height: 90.0,
                      child: const Loading(
                          color: Colors.white, circleTimeSeconds: 2),
                    )
                  : RefreshListView(
                      header: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Cursos para colaborar",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      bottomOffset: 170.0,
                      refreshController: controller.refreshController,
                      onRefresh: () =>
                          controller.carregarCursos(pullRefresh: true),
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
                    ),
            ),
            const Dummy(),
          ],
        ),
      ),
      controller: controller,
    );
  }

  Widget buildCurso(BuildContext context, InformacoesCursoProjeto info) {
    return InkWell(
      onTap: () async {
        await Get.toNamed(
          Routes.visualizacaoCurso,
          arguments: info.curso,
        );
        controller.carregarCursos(pullRefresh: true);
      },
      child: IconLabelDescriptionCard(
        value: IconLabelDescriptionCardProps(
          base64Image: info.imagemProjeto,
          label: info.nomeProjeto,
          description: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                info.curso.nome,
                textScaleFactor: 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
