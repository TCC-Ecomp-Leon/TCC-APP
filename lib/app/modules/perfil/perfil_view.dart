import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/perfil/perfil_controller.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/card_overlap_image.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';
import 'package:tcc_app/widgets/change_editable_text_field.dart';
import 'package:tcc_app/widgets/loading.dart';

class PerfilView extends GetView<PerfilController> {
  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.loadingImagemPerfil
                    ? const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Loading(
                              color: Colors.white, circleTimeSeconds: 5),
                        ),
                      )
                    : CardOverlapImage(
                        changeImage: controller.alterarFotoPerfil,
                        base64image: controller.getPerfilEdicao.fotoPerfil,
                        child: Text(
                          controller.getPerfilEdicao.nome,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                controller.salvandoEdicao
                    ? const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Loading(
                              color: Colors.white, circleTimeSeconds: 5),
                        ),
                      )
                    : Column(
                        children: [
                          CardOverlapTitle(
                            onClickEdit: controller.modoEdicao
                                ? controller.cancelarEdicao
                                : controller.entrarModoEdicao,
                            title: "Perfil",
                            icon: controller.modoEdicao
                                ? Icons.cancel
                                : Icons.edit,
                            children: [
                              ChangeEditableTextField(
                                label: "Nome",
                                editable: controller.modoEdicao,
                                controller: controller.nomeUsuario,
                              ),
                              ChangeEditableTextField(
                                label: "Email",
                                editable: false,
                                controller: TextEditingController(
                                    text: controller.getPerfilEdicao.email),
                              ),
                              ChangeEditableTextField(
                                label: "Telefone",
                                editable: controller.modoEdicao,
                                controller: controller.telefoneUsuario,
                              ),
                              ChangeEditableTextField(
                                label: "Entrada em",
                                editable: false,
                                controller: TextEditingController(
                                  text: diaComAno(
                                    controller.getPerfilEdicao.entradaEm,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          controller.modoEdicao
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            controller.cancelarEdicao(),
                                        child: const Text("Cancelar"),
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(7.0),
                                          primary: Colors.white,
                                          backgroundColor: Colors.redAccent,
                                          onSurface: Colors.grey,
                                          textStyle:
                                              const TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            controller.salvarEdicao(),
                                        child: const Text("Salvar"),
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(7.0),
                                          primary: Colors.white,
                                          backgroundColor: Colors.green,
                                          onSurface: Colors.grey,
                                          textStyle:
                                              const TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                    ],
                                  ))
                              : Container(),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () =>
                                  controller.loginController.signOut(),
                              child: const Text("Sair"),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(7.0),
                                primary: Colors.white,
                                backgroundColor: Colors.redAccent,
                                onSurface: Colors.grey,
                                textStyle: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
      controller: controller,
    );
  }
}
