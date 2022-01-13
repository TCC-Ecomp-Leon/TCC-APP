import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/duvidas/modules/criacaoDuvida/criacao_duvida_controller.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tcc_app/widgets/dropdown.dart';
import 'package:tcc_app/widgets/loading.dart';

typedef OnChangeDropDown = void Function(int index);
typedef OnFocusFunction = void Function();

class CriacaoDuvidaView extends GetView<CriacaoDuvidaController> {
  Widget buildTextField(
      TextEditingController textEditingController, String hintText,
      {int maxLines = 1, OnFocusFunction? onFocusFunction}) {
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
                    width: width * 0.6,
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
                      alignment: Alignment.centerRight,
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
                () => controller.criandoDuvida
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
                        controller: controller.scrollController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildTextField(
                              controller.titulo,
                              "Título",
                            ),
                            buildTextField(
                              controller.descricao,
                              "Descrição",
                            ),
                            buildDropDown(
                              context,
                              "Curso",
                              "Nenhum",
                              controller.cursosAluno
                                  .map((e) => e.nome)
                                  .toList(),
                              controller.indiceCursoSelecionado + 1,
                              controller.selecionarCurso,
                            ),
                            buildDropDown(
                              context,
                              "Matérias",
                              "Nenhum",
                              controller.materiasCursoSelecionado == null
                                  ? []
                                  : controller.materiasCursoSelecionado!
                                      .map((e) => e.nome)
                                      .toList(),
                              controller.indiceMateriaSelecionada + 1,
                              controller.selecionarMateria,
                            ),
                            buildDropDown(
                              context,
                              "Curso Universitário",
                              "Nenhum",
                              controller.cursosUniversitarios
                                  .map((e) => e.nome)
                                  .toList(),
                              controller.indiceCursoUniversitarioSelecionado +
                                  1,
                              controller.selecionarCursoUniversitario,
                            ),
                            buildTextField(
                                controller.mensagemInicial, "Mensagem inicial",
                                maxLines: 5,
                                onFocusFunction:
                                    controller.onFocusMensagemInicial),
                            controller.erroCampos != null
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      controller.erroCampos!,
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
            controller.criacaoDuvida();
          },
          child: Text(controller.criandoDuvida ? "" : "Criar dúvida"),
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
