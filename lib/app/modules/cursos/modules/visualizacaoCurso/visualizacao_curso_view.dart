import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/visualizacao_curso_controller.dart';
import 'package:tcc_app/models/Atividade.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';
import 'package:tcc_app/widgets/change_editable_text_field.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

typedef OnSelectDate = void Function(DateTime date);
typedef OnFocusFunction = void Function();
typedef OnChangeTextField = void Function();

class VisualizacaoCursoView extends GetView<VisualizacaoCursoController> {
  Widget buildAtividade(BuildContext context, Atividade atividade) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {},
      child: Opacity(
        opacity: 1.0,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.menu_book,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Text(atividade.nome),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    textoParaTamanhoFixo(
                      atividade.idCurso,
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

  Widget buildDateSelector(
      BuildContext context, String hintText, DateTime dateTime,
      {int maxLines = 1, OnSelectDate? onSelectDate}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 2.0,
        bottom: 2.0,
      ),
      child: Column(
        children: [
          Text(
            hintText,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: dateTime,
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1));
                    if (date != null && onSelectDate != null) {
                      onSelectDate(date);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            diaComAno(
                              dateTime,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
          Text(
            hintText,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.black,
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
                              labelStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.grey),
                              // errorText: erroMessage,
                            ),
                            style: const TextStyle(color: Colors.white),
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

  Widget duracaoCurso() {
    final Curso curso = controller.curso;
    int diasCurso = curso.fimCurso.difference(curso.inicioCurso).inDays;
    int diasCursados = DateTime.now().difference(curso.inicioCurso).inDays;
    if (diasCursados > diasCurso) {
      diasCursados = diasCurso;
    }

    return CircularPercentIndicator(
      radius: 70.0,
      lineWidth: 8.0,
      animation: true,
      percent: 0.7,
      center: Text(
        diasCursados.toString() + "/" + diasCurso.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textScaleFactor: 0.8,
      ),
      footer: const Padding(
        padding: EdgeInsets.only(
          top: 5.0,
        ),
        child: Text(
          "Dias Curso",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.purple,
    );
  }

  Widget buildCampo(String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + ":",
          textAlign: TextAlign.start,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget cardRotuloAtividades(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Atividades: ",
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {
                  controller.visualizarAbertas();
                },
                child: Card(
                  color: controller.visualizandoAbertas
                      ? Colors.teal
                      : Colors.grey,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Abertas",
                      textScaleFactor: 0.9,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.visualizarFechadas();
                },
                child: Card(
                  color: controller.visualizandoFechadas
                      ? Colors.teal
                      : Colors.grey,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Fechadas",
                      textScaleFactor: 0.9,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.visualizarTodas();
                },
                child: Card(
                  color:
                      controller.visualizandoTodas ? Colors.teal : Colors.grey,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "Todas",
                      textScaleFactor: 0.9,
                    ),
                  ),
                ),
              ),
              controller.permissaoEditar
                  ? const SizedBox(
                      width: 10.0,
                    )
                  : Container(),
              controller.permissaoEditar
                  ? InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.add,
                          color: Colors.orange,
                          size: 15.0,
                        ),
                        maxRadius: 10.0,
                        backgroundColor: Colors.amberAccent,
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Obx(
          () => RefreshListView(
            header: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5.0,
                              left: 5.0,
                              right: 5.0,
                            ),
                            child: controller.editandoCurso
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      buildTextField(
                                        controller.nomeCurso,
                                        "Nome",
                                        erroMessage: controller.nomeCursoErro,
                                        onChangeTextField:
                                            controller.onChangeNomeCurso,
                                      ),
                                      buildTextField(
                                        controller.descricaoCurso,
                                        "Descrição",
                                        erroMessage:
                                            controller.descricaoCursoErro,
                                        onChangeTextField:
                                            controller.onChangeDescricaoCurso,
                                      ),
                                      buildDateSelector(
                                        context,
                                        "Início do curso",
                                        controller.inicioCurso,
                                        onSelectDate: (dateTime) {
                                          controller.setInicioCurso(dateTime);
                                        },
                                      ),
                                      buildDateSelector(
                                        context,
                                        "Fim do curso",
                                        controller.fimCurso,
                                        onSelectDate: (dateTime) {
                                          controller.setFimCurso(dateTime);
                                        },
                                      ),
                                    ],
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              110.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              buildCampo(
                                                "Nome",
                                                controller.curso.nome,
                                              ),
                                              buildCampo(
                                                "Descrição",
                                                controller.curso.descricao,
                                              ),
                                            ],
                                          ),
                                        ),
                                        duracaoCurso(),
                                      ],
                                    )),
                          )),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Curso",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                controller.permissaoEditar
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.editandoCurso
                            ? [
                                TextButton(
                                  onPressed: () {
                                    controller.sairModoEdicaoCurso();
                                  },
                                  child: const Text("Cancelar"),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(10.0),
                                    primary: Colors.white,
                                    backgroundColor: Colors.red,
                                    onSurface: Colors.grey,
                                    textStyle: const TextStyle(fontSize: 17.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.salvarEdicaoCurso();
                                  },
                                  child: const Text("Salvar"),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(10.0),
                                    primary: Colors.white,
                                    backgroundColor: Colors.green,
                                    onSurface: Colors.grey,
                                    textStyle: const TextStyle(fontSize: 17.0),
                                  ),
                                )
                              ]
                            : [
                                TextButton(
                                  onPressed: () {
                                    controller.entrarModoEdicaoCurso();
                                  },
                                  child: const Text("Editar"),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(10.0),
                                    primary: Colors.white,
                                    backgroundColor: Colors.teal,
                                    onSurface: Colors.grey,
                                    textStyle: const TextStyle(fontSize: 17.0),
                                  ),
                                )
                              ],
                      )
                    : Container(),
                controller.erro != null
                    ? Text(
                        controller.erro!,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                        textScaleFactor: 0.8,
                      )
                    : Container(),
                const SizedBox(
                  height: 20.0,
                ),
                // const Text(
                //   "Atividades",
                //   textScaleFactor: 1.2,
                // ),
                cardRotuloAtividades(context),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            bottomOffset: controller.editandoCurso
                ? 450
                : controller.permissaoEditar
                    ? 285.0
                    : 235.0,
            child: controller.carregandoAtividades
                ? Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    child: const Loading(
                        color: Colors.white, circleTimeSeconds: 2),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0.0),
                    itemCount: controller.atividades.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildAtividade(
                          context, controller.atividades[index]);
                    },
                  ),
            refreshController: controller.refreshController,
            onRefresh: () => controller.recarregarCurso(),
          ),
        ),
      ),
    );
  }
}
