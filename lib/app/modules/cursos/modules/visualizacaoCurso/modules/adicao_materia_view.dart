import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/modules/adicao_materia_controller.dart';
import 'package:tcc_app/widgets/loading.dart';

typedef OnSelectDate = void Function(DateTime date);
typedef OnFocusFunction = void Function();
typedef OnTextFieldChanged = void Function();

class AdicaoMateriaView extends GetView<AdicaoMateriaController> {
  const AdicaoMateriaView({Key? key}) : super(key: key);

  Widget buildTextField(
    TextEditingController textEditingController,
    String hintText, {
    int maxLines = 1,
    OnFocusFunction? onFocusFunction,
    String? erroMessage,
    OnTextFieldChanged? onTextFieldChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 2.0,
        bottom: 2.0,
      ),
      child: Column(
        children: [
          Text(hintText),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            onTap: onFocusFunction,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: hintText,
                              border: InputBorder.none,
                              labelStyle: const TextStyle(color: Colors.black),
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            style: const TextStyle(color: Colors.black),
                            maxLines: maxLines,
                            onChanged: (value) {
                              if (onTextFieldChanged != null) {
                                onTextFieldChanged();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          erroMessage != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    erroMessage,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.red,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height - 134.0;
    double topBottomPaddingAlignment = 30.0 + (height - 598) / 2;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Center(
          child: KeyboardVisibilityBuilder(
            builder: (BuildContext context, bool isVisible) {
              const double bottomInsets = 210;
              return Obx(
                () => controller.adicionando
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
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildTextField(
                              controller.nome,
                              "Nome matéria",
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            buildTextField(
                              controller.descricao,
                              "Descrição",
                              maxLines: 5,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            controller.erro != null
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      controller.erro!,
                                      style: const TextStyle(
                                          fontSize: 15.0, color: Colors.red),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height:
                                  !isVisible ? topBottomPaddingAlignment : 0.0,
                            ),
                            const SizedBox(
                              height: bottomInsets,
                            ),
                          ],
                        ),
                      ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => TextButton(
          onPressed: () {
            controller.adicaoMateria();
          },
          child: Text(controller.adicionando ? "" : "Adicionar matéria"),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            primary: Colors.white,
            backgroundColor: Colors.teal,
            onSurface: Colors.grey,
            textStyle: const TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }
}
