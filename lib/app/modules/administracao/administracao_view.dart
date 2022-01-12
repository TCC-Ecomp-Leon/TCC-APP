import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/administracao/administracao_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/widgets/dropdown.dart';
import 'package:tcc_app/widgets/icon_label_description_card.dart';
import 'package:tcc_app/widgets/list_view.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AdministracaoView extends GetView<AdministracaoController> {
  Widget buildCriarCodigoDeEntrada(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            controller.entrarEmModoDeAdicaoCodigo();
            return PopUpCriacaoCodigoDeEntrada(
              controller: controller,
            );
          },
        );
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
                    child: const Text("Criar código de entrada"),
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

  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      controller: controller,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
          child: Column(
            children: [
              buildCriarCodigoDeEntrada(context),
              Obx(
                () => controller.carregandoCodigosDeEntrada
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
                    : controller.codigosDeEntrada.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height - 200.0,
                            child: const Center(
                              child: Text("Nenhum código de entrada"),
                            ),
                          )
                        : GenericListView(
                            itens: controller.codigosDeEntrada,
                            render: (value, index) {
                              return IconLabelDescriptionCard(
                                value: IconLabelDescriptionCardProps(
                                  base64Image: controller.projeto.imgProjeto,
                                  label: value,
                                  description: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Text(
                                          value,
                                          textScaleFactor: 0.6,
                                        ),
                                      ),
                                      const Text(
                                        "Gerado em: ",
                                        textScaleFactor: 0.6,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef OnChangeDropDown = void Function(int index);

typedef OnFocusFunction = void Function();

class PopUpCriacaoCodigoDeEntrada extends StatelessWidget {
  final AdministracaoController controller;
  PopUpCriacaoCodigoDeEntrada({
    required this.controller,
    Key? key,
  }) : super(key: key);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Container(
                alignment: Alignment.centerRight,
                // width: 200.0,
                padding: const EdgeInsets.only(
                  right: 8.0,
                  left: 8.0,
                ),
                child: DropDown<String>(
                  alignment: Alignment.centerRight,
                  selectedIndex: selectedIndex + 1,
                  items: [emptyText, ...items],
                  onChangeDropDown: (index) {
                    onChange(index - 1);
                  },
                  getItemText: (value) => value,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Novo código de entrada"),
      content: SizedBox(
        height: 400.0,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Obx(
          () => controller.estadoAdicaoCodigo ==
                  EstadoAdicaoCodigoDeEntrada.Carregando
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child: const Loading(
                    color: Colors.white,
                    circleTimeSeconds: 2,
                  ),
                )
              : controller.estadoAdicaoCodigo ==
                      EstadoAdicaoCodigoDeEntrada.Adicionado
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Código de entrada adicionado",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        QrImage(
                          data: controller.codigoGerado ?? "",
                          version: QrVersions.auto,
                          size: 200.0,
                          foregroundColor: Colors.white,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200.0,
                                  child: Text(
                                    controller.codigoGerado ?? "",
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Clipboard.setData(
                                      ClipboardData(
                                        text: controller.codigoGerado,
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.copy),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextButton(
                          onPressed: () {
                            controller.sairModoAdicaoCodigo();
                          },
                          child: const Text("Fechar"),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            primary: Colors.white,
                            backgroundColor: Colors.teal,
                            onSurface: Colors.grey,
                            textStyle: const TextStyle(fontSize: 17.0),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Professor?"),
                            IconButton(
                              onPressed: () {
                                controller.alterarCodigoParaProfessor();
                              },
                              icon: Icon(controller.codigoParaProfessor
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        buildDropDown(
                          context,
                          "Curso",
                          "Nenhum",
                          controller.cursos.map((e) => e.nome).toList(),
                          controller.indiceCursoSelecionado,
                          controller.selecionarCurso,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        controller.codigoParaProfessor
                            ? buildDropDown(
                                context,
                                "Matéria",
                                "Nenhum",
                                controller.materiasCurso
                                    .map((e) => e.nome)
                                    .toList(),
                                controller.indiceMateriaSelecionada,
                                controller.selecionarMateria,
                              )
                            : Container(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        controller.erroAdicaoCodigoDeEntrada != null
                            ? Text(
                                controller.erroAdicaoCodigoDeEntrada!,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextButton(
                          onPressed: () {
                            controller.adicionarCodigo();
                          },
                          child: const Text("Criar"),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                            onSurface: Colors.grey,
                            textStyle: const TextStyle(fontSize: 17.0),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
