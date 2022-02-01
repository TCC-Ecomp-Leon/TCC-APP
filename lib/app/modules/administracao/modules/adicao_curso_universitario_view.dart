import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/administracao/modules/adicao_curso_universitario_controller.dart';
import 'package:tcc_app/widgets/dropdown.dart';
import 'package:tcc_app/widgets/loading.dart';

typedef OnFocusFunction = void Function();
typedef OnChangeDropDown = void Function(int index);
typedef OnChangeTextField = void Function();

class AdicaoCursoUniversitarioView
    extends GetView<AdicaoCursoUniversitarioController> {
  const AdicaoCursoUniversitarioView({Key? key}) : super(key: key);

  Widget buildTextField(
    TextEditingController textEditingController,
    String hintText, {
    int maxLines = 1,
    OnFocusFunction? onFocusFunction,
    TextInputType textInputType = TextInputType.text,
    String? erroMessage,
    OnChangeTextField? onChangeTextField,
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
                            keyboardType: textInputType,
                            onTap: onFocusFunction,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: hintText,
                              border: InputBorder.none,
                              labelStyle: const TextStyle(color: Colors.black),
                              hintStyle: const TextStyle(color: Colors.grey),
                              // errorText: erroMessage,
                            ),
                            style: const TextStyle(color: Colors.black),
                            maxLines: maxLines,
                            onChanged: (value) {
                              if (onChangeTextField != null) {
                                onChangeTextField();
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 2.0),
                    child: Text(
                      erroMessage,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.red[300],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget buildDropDown(
    BuildContext context,
    String text,
    String emptyText,
    List<String> items,
    int selectedIndex,
    OnChangeDropDown onChange,
  ) {
    double width = MediaQuery.of(context).size.width - 50.0;

    return Column(
      children: [
        Text(text),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: width * 0.5,
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: DropDown<String>(
                      selectedIndex: selectedIndex,
                      items: [emptyText, ...items],
                      onChangeDropDown: (index) {
                        onChange(index - 1);
                      },
                      getItemText: (value) => value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
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
                () => controller.adicionandoCurso
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
                            buildTextField(controller.nome, "Nome",
                                erroMessage: controller.nomeValido
                                    ? null
                                    : "Nome inválido",
                                onChangeTextField: controller.onChangeNome),
                            buildTextField(controller.descricao, "Descrição",
                                erroMessage: controller.descricaoValida
                                    ? null
                                    : "Descrição inválida",
                                onChangeTextField:
                                    controller.onChangeDescricao),
                            buildTextField(
                              controller.semestresPrevistos,
                              "Semestres previstos",
                              textInputType: TextInputType.number,
                              erroMessage: controller.semestresValidos
                                  ? null
                                  : "Número inválido",
                              onChangeTextField: controller.onChangeSemestres,
                            ),
                            buildDropDown(
                              context,
                              "Curso anterior",
                              "Nenhum",
                              controller.cursosUniversitarios
                                  .map((e) => e.nome)
                                  .toList(),
                              controller.indiceCursoAnterior + 1,
                              (index) {
                                controller.selecionarCurso(index);
                              },
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
            controller.adicionarCurso();
          },
          child: Text(controller.adicionandoCurso ? "" : "Adicionar curso"),
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
