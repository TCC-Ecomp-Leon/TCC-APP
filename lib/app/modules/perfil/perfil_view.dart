import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/perfil/perfil_controller.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/card_overlap_image.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';
import 'package:tcc_app/widgets/change_editable_text_field.dart';

class PerfilView extends GetView<PerfilController> {
  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardOverlapImage(
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
              Obx(
                () => CardOverlapTitle(
                  onClickEdit: controller.modoEdicao
                      ? controller.cancelarEdicao
                      : controller.entrarModoEdicao,
                  title: "Perfil",
                  icon: controller.modoEdicao ? Icons.cancel : Icons.edit,
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
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      controller: controller,
    );
  }

  Widget nomeCampo(String campo) {
    return Text(
      campo,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget valorCampo(String valor) {
    return Text(
      valor,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget informacoesDuasColunasFixas(
    BuildContext context, {
    required String campo,
    required String valor,
    bool aoContrario = false,
  }) {
    double width = MediaQuery.of(context).size.width - 90.0;
    double divisao1 = width * 0.35;
    double divisao2 = width * 0.65;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: aoContrario ? divisao2 : divisao1,
          child: nomeCampo(campo),
        ),
        SizedBox(
          width: aoContrario ? divisao1 : divisao2,
          child: valorCampo(valor),
        ),
      ],
    );
  }
}
