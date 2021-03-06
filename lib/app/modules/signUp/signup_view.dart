import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signUp/signup_controller.dart';
import 'package:tcc_app/widgets/circular_upload_image.dart';
import 'package:tcc_app/widgets/labeled_switch.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/qr_code_reader.dart';
import 'package:tcc_app/widgets/text_field.dart';
import 'package:tcc_app/utils/iterable.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: KeyboardVisibilityBuilder(
      builder: (BuildContext context, bool visible) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 60.0,
            bottom: visible ? 200 : 20.0,
          ),
          child: Obx(
            () => controller.loading
                ? Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    child: const Loading(
                      color: Colors.white,
                      circleTimeSeconds: 2,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LabeledSwitch(
                          minWidth: 100.0,
                          labels: tipoRegistros,
                          index: getIndexTipoRegistro(controller.tipoRegistro),
                          switchFunction: (index) {
                            controller.alterarTipoRegistro(
                                getRegistroFromIndex(index));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...controller.campos
                            .mapIndexed(
                              (e, index) => Container(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Stack(
                                  children: [
                                    TextFieldImplementation(
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
                                    e.cameraOption
                                        ? Container(
                                            height: 60.0,
                                            padding: const EdgeInsets.only(
                                              right: 10.0,
                                              bottom: 2.0,
                                            ),
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(
                                                  () => QrCodeReader(
                                                    onRead: (value) {
                                                      e.controller.text = value;
                                                    },
                                                    readingMessage:
                                                        "Leia o seu c??digo do projeto",
                                                  ),
                                                );
                                              },
                                              child: const Icon(
                                                Icons.camera,
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        controller.tipoRegistro == TipoRegistro.projeto
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
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    ));
  }
}

enum TipoRegistro {
  aluno,
  projeto,
  universitario,
}

const List<String> tipoRegistros = ["Geral", "Projeto", "Universitario"];

TipoRegistro getRegistroFromIndex(int index) {
  switch (index) {
    case 0:
      return TipoRegistro.aluno;
    case 1:
      return TipoRegistro.projeto;
    case 2:
      return TipoRegistro.universitario;
    default:
      return TipoRegistro.aluno;
  }
}

int getIndexTipoRegistro(TipoRegistro tipoRegistro) {
  switch (tipoRegistro) {
    case TipoRegistro.aluno:
      return 0;
    case TipoRegistro.projeto:
      return 1;
    case TipoRegistro.universitario:
      return 2;
    default:
      return 0;
  }
}
