import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signUp/signup_controller.dart';
import 'package:tcc_app/widgets/card_overlap_image.dart';
import 'package:tcc_app/widgets/circular_upload_image.dart';
import 'package:tcc_app/widgets/labeled_switch.dart';
import 'package:tcc_app/widgets/text_field.dart';
import 'package:tcc_app/utils/iterable.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 60.0,
          bottom: 20.0,
        ),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LabeledSwitch(
                  minWidth: 100.0,
                  labels: tipoRegistros,
                  index: getIndexTipoRegistro(controller.tipoRegistro),
                  switchFunction: (index) {
                    controller.alterarTipoRegistro(getRegistroFromIndex(index));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ...controller.campos
                    .mapIndexed(
                      (e, index) => Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFieldImplementation(
                          controller: e.controller,
                          label: e.label,
                          useHidden: e.useHidden,
                          textInputType: e.textInputType,
                          errorMessage: e.errorMessage,
                          isHidden: !e.visible,
                          onVisibleChanged: e.onVisibleChanged,
                          onChange: () {
                            controller.validateItem(index);
                          },
                        ),
                      ),
                    )
                    .toList(),
                const SizedBox(
                  height: 10.0,
                ),
                controller.tipoRegistro == TipoRegistro.Projeto
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: CircularUploadImage(
                          changeImage: controller.alterarImagemProjeto,
                          base64image: controller.imagemProjeto,
                        ),
                      )
                    : Container(),
                TextButton(
                  onPressed: () => controller.registrar(),
                  child: const Text("Registrar"),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10.0),
                    primary: Colors.white,
                    backgroundColor: Colors.teal,
                    onSurface: Colors.grey,
                    textStyle: const TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum TipoRegistro {
  Aluno,
  Projeto,
  Universitario,
}

const List<String> tipoRegistros = ["Aluno", "Projeto", "Universitario"];

TipoRegistro getRegistroFromIndex(int index) {
  switch (index) {
    case 0:
      return TipoRegistro.Aluno;
    case 1:
      return TipoRegistro.Projeto;
    case 2:
      return TipoRegistro.Universitario;
    default:
      return TipoRegistro.Aluno;
  }
}

int getIndexTipoRegistro(TipoRegistro tipoRegistro) {
  switch (tipoRegistro) {
    case TipoRegistro.Aluno:
      return 0;
    case TipoRegistro.Projeto:
      return 1;
    case TipoRegistro.Universitario:
      return 2;
    default:
      return 0;
  }
}
