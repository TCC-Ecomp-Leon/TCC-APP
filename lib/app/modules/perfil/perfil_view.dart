import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/perfil/perfil_controller.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/utils/iterable.dart';
import 'package:tcc_app/widgets/card_overlap_image.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';
import 'package:tcc_app/widgets/change_editable_text_field.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/qr_code_reader.dart';

class PerfilView extends GetView<PerfilController> {
  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Column(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () =>
                                                controller.cancelarEdicao(),
                                            child: const Text("Cancelar"),
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              primary: Colors.white,
                                              backgroundColor: Colors.redAccent,
                                              onSurface: Colors.grey,
                                              textStyle: const TextStyle(
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                controller.salvarEdicaoPerfil(),
                                            child: const Text("Salvar"),
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              primary: Colors.white,
                                              backgroundColor: Colors.green,
                                              onSurface: Colors.grey,
                                              textStyle: const TextStyle(
                                                  fontSize: 15.0),
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
                controller.projetoEmEdicao != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          controller.loadingImagemProjeto
                              ? const Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Loading(
                                        color: Colors.white,
                                        circleTimeSeconds: 5),
                                  ),
                                )
                              : CardOverlapImage(
                                  changeImage: controller.alterarImagemProjeto,
                                  base64image:
                                      controller.projetoEmEdicao!.imgProjeto,
                                  child: Text(
                                    controller.projetoEmEdicao!.nome,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          controller.salvandoEdicaoProjeto
                              ? const Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Loading(
                                        color: Colors.white,
                                        circleTimeSeconds: 5),
                                  ),
                                )
                              : Column(
                                  children: [
                                    CardOverlapTitle(
                                      onClickEdit: controller.modoEdicaoProjeto
                                          ? controller.cancelarEdicaoProjeto
                                          : controller.entrarModoEdicaoProjeto,
                                      title: "Projeto",
                                      icon: controller.modoEdicaoProjeto
                                          ? Icons.cancel
                                          : Icons.edit,
                                      children: [
                                        ...controller.camposProjeto
                                            .mapIndexed(
                                              (e, index) =>
                                                  ChangeEditableTextField(
                                                label: e.label,
                                                editable: controller
                                                    .modoEdicaoProjeto,
                                                controller: e.controller,
                                                onChange: () {
                                                  controller
                                                      .onChangeCampoProjeto(
                                                          index);
                                                },
                                                errorMessage: e.errorMessage,
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    controller.modoEdicaoProjeto
                                        ? Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: () => controller
                                                      .cancelarEdicaoProjeto(),
                                                  child: const Text("Cancelar"),
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            7.0),
                                                    primary: Colors.white,
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    onSurface: Colors.grey,
                                                    textStyle: const TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                TextButton(
                                                  onPressed: () => controller
                                                      .salvarEdicaoProjeto(),
                                                  child: const Text("Salvar"),
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            7.0),
                                                    primary: Colors.white,
                                                    backgroundColor:
                                                        Colors.green,
                                                    onSurface: Colors.grey,
                                                    textStyle: const TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                        ],
                      )
                    : Container(),
                Obx(
                  () => CardInformacoesPerfilGeral(
                    perfil: controller.perfil,
                    controller: controller,
                  ),
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

class CardInformacoesPerfilGeral extends StatelessWidget {
  final Perfil perfil;
  final PerfilController controller;
  const CardInformacoesPerfilGeral({
    required this.perfil,
    required this.controller,
    Key? key,
  }) : super(key: key);

  List<Widget> buildInformacoesCard() {
    List<Widget> children = [
      const SizedBox(
        height: 5.0,
      ),
    ];

    final associacoes = perfil.associacoes;
    if (associacoes != null) {
      if (associacoes.aluno.alunoParceiro) {
        final cursos = associacoes.aluno.cursos;
        children.add(
          const Text(
            "Aluno",
            style: TextStyle(color: Colors.black),
          ),
        );
        if (cursos != null) {
          children = [
            ...children,
            ...cursos
                .map((e) => Text(
                      "Curso: " + e.nome,
                      style: const TextStyle(color: Colors.black),
                    ))
                .toList()
          ];
        }
      }
      if (associacoes.professor.professor) {
        children.add(
          const Text(
            "Professor",
            style: TextStyle(color: Colors.black),
          ),
        );
        final materias = associacoes.professor.materiasProfessor;
        if (materias != null) {
          children = [
            ...children,
            ...materias
                .map((e) => Text(
                      "Matéria: " + e.nome,
                      style: const TextStyle(color: Colors.black),
                    ))
                .toList()
          ];
        }
      }
    }
    if (children.length == 1) {
      children.add(
        const Text(
          "Sem nenhuma associação",
          style: TextStyle(color: Colors.black),
        ),
      );
    }
    children.add(
      const SizedBox(
        height: 5.0,
      ),
    );

    return children;
  }

  _dialogAssociar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUpAdicaoCodigoDeEntrada(
          controller: controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: controller.usuarioGeral
          ? CardOverlapTitle(
              onClickEdit: () => _dialogAssociar(context),
              title: "Usuário geral",
              icon: Icons.add,
              children: buildInformacoesCard()
                  .map(
                    (e) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: e,
                    ),
                  )
                  .toList(),
            )
          : Container(),
    );
  }
}

class PopUpAdicaoCodigoDeEntrada extends StatefulWidget {
  final PerfilController controller;
  const PopUpAdicaoCodigoDeEntrada({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _PopUpAdicaoCodigoDeEntradaState createState() =>
      _PopUpAdicaoCodigoDeEntradaState();
}

class _PopUpAdicaoCodigoDeEntradaState
    extends State<PopUpAdicaoCodigoDeEntrada> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    widget.controller.inicioInsercaoCodigoEntrada();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Insira seu código"),
      content: SizedBox(
        height: 150.0,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Obx(() => widget.controller.estadoAdicaoCodigoEntrada ==
                EstadoAdicaoCodigoEntrada.Carregando
            ? Container(
                alignment: Alignment.center,
                height: 100.0,
                child: const Loading(color: Colors.white, circleTimeSeconds: 2),
              )
            : widget.controller.estadoAdicaoCodigoEntrada ==
                    EstadoAdicaoCodigoEntrada.Adicionado
                ? const Center(
                    child: Text("Código adicionado com sucesso"),
                  )
                : widget.controller.estadoAdicaoCodigoEntrada ==
                        EstadoAdicaoCodigoEntrada.Erro
                    ? const Center(
                        child: Text(
                            "Erro ao adicionar o código. Talvez ele já tenha sido usado, contate seu projeto."),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 15.0),
                                decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: const EdgeInsets.only(
                                    right: 50.0,
                                    top: 16.0,
                                    bottom: 16.0,
                                    left: 16.0,
                                  ),
                                  // fillColor: widget.fillColor,
                                  border: const OutlineInputBorder(),
                                  hintText: "Código de entrada",
                                  errorText: textEditingController.text.isEmpty
                                      ? "Necessário preencher"
                                      : null,
                                ),
                                controller: textEditingController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                              Container(
                                height: 50.0,
                                padding: const EdgeInsets.only(
                                    right: 10.0, bottom: 2.0),
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Get.off(
                                      () => QrCodeReader(
                                        onRead: (value) {
                                          textEditingController.text = value;
                                        },
                                        readingMessage:
                                            "Leia o seu código do projeto",
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.camera,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextButton(
                            onPressed: () {
                              if (textEditingController.text.isNotEmpty) {
                                widget.controller.adicionarCodigoDeEntrada(
                                  textEditingController.text,
                                );
                              }
                            },
                            child: const Text("Adicionar"),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(10.0),
                              primary: Colors.white,
                              backgroundColor: Colors.green,
                              onSurface: Colors.grey,
                              textStyle: const TextStyle(fontSize: 17.0),
                            ),
                          )
                        ],
                      )),
      ),
    );
  }
}
