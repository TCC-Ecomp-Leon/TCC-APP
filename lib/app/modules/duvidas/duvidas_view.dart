import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/models/Duvida.dart';
import 'package:tcc_app/screens/dummy.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/loading.dart';

class DuvidasView extends GetView<DuvidasController> {
  Widget buildCriarDuvida(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {
        await Get.toNamed(Routes.criacaoDuvida);
        controller.carregarDuvidas();
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
                    child: const Text("Criar dúvida"),
                  ),
                  const CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.question_answer,
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

  Widget buildDuvida(BuildContext context, Duvida duvida) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {
        await Get.toNamed(
          Routes.visualizacaoDuvida,
          arguments: duvida,
        );
        controller.carregarDuvidas();
      },
      child: Opacity(
        opacity: duvida.resolvida ? 0.5 : 1.0,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.question_answer,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Text(duvida.titulo),
                    ),
                    SizedBox(
                      child: Text(
                        duvida.mensagens.isEmpty
                            ? ""
                            : diaMes(
                                  duvida.mensagens.last.horario,
                                ) +
                                "\n" +
                                horario(
                                  duvida.mensagens.last.horario,
                                ),
                      ),
                    )
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    duvida.mensagens.isEmpty
                        ? ""
                        : textoParaTamanhoFixo(
                            duvida.mensagens.last.mensagem,
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
      controller: controller,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
          child: Obx(
            () => Column(
              children: [
                controller.aluno ? buildCriarDuvida(context) : Container(),
                controller.carregandoDuvidas
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 200.0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 100.0,
                            child: const Loading(
                                color: Colors.white, circleTimeSeconds: 2),
                          ),
                        ),
                      )
                    : controller.duvidas.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height - 200.0,
                            child: const Center(
                              child: Text("Nenhuma dúvida"),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 0.0),
                            itemCount: controller.duvidas.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return buildDuvida(
                                context,
                                controller.duvidas[index],
                              );
                            },
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
