import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/administracao/administracao_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/models/CodigoEntrada.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/models/Materia.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/models/Projeto.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/carousel_indicator.dart';
import 'package:tcc_app/widgets/dropdown.dart';
import 'package:tcc_app/widgets/icon_label_description_card.dart';
import 'package:tcc_app/widgets/list_view.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AdministracaoView extends GetView<AdministracaoController> {
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      controller: controller,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
          child: loginController.perfil.regra == RegraPerfil.Administrador
              ? ViewAdministrador(
                  controller: controller,
                  loginController: loginController,
                )
              : ViewProjeto(
                  controller: controller,
                  loginController: loginController,
                ),
        ),
      ),
    );
  }
}

class ViewAdministrador extends StatelessWidget {
  final AdministracaoController controller;
  final LoginController loginController;

  const ViewAdministrador({
    required this.controller,
    required this.loginController,
    Key? key,
  }) : super(key: key);

  Widget buildProjeto(BuildContext context, Projeto projeto) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return PopUpViewProjeto(
              controller: controller,
              projeto: projeto,
            );
          },
        );
      },
      child: IconLabelDescriptionCard(
        value: IconLabelDescriptionCardProps(
          base64Image: projeto.imgProjeto,
          label: projeto.nome,
          description: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  projeto.endereco.cidade,
                  textScaleFactor: 0.6,
                ),
              ),
              Text(
                projeto.aprovado
                    ? "Aprovado em: " +
                        diaComAno(projeto.entradaEm!) +
                        horario(projeto.entradaEm!)
                    : "Requisitado em: " +
                        diaComAno(projeto.requisicaoEntradaEm) +
                        horario(projeto.requisicaoEntradaEm),
                textScaleFactor: 0.6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselIndicator(
      children: [
        Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Projetos aprovados",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              controller.carregandoProjetosAprovados
                  ? Container(
                      alignment: Alignment.center,
                      height: 100.0,
                      child: const Loading(
                          color: Colors.white, circleTimeSeconds: 2),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.projetosAprovados.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildProjeto(
                          context,
                          controller.projetosAprovados[index],
                        );
                      },
                    ),
            ],
          ),
        ),
        Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Projetos necessitando aprovação",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              controller.carregandoProjetosNaoAprovados
                  ? Container(
                      alignment: Alignment.center,
                      height: 100.0,
                      child: const Loading(
                          color: Colors.white, circleTimeSeconds: 2),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.projetosNaoAprovados.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildProjeto(
                          context,
                          controller.projetosNaoAprovados[index],
                        );
                      },
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class PopUpViewProjeto extends StatelessWidget {
  final AdministracaoController controller;
  final Projeto projeto;

  const PopUpViewProjeto({
    required this.controller,
    required this.projeto,
    Key? key,
  }) : super(key: key);

  Widget buildCampo(String nomeCampo, String? campo) {
    if (campo == null) return Container();

    return Text(nomeCampo + ": " + campo);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Projeto"),
      content: Obx(
        () => SizedBox(
          height: 450.0,
          width: MediaQuery.of(context).size.width * 0.9,
          child: controller.aprovandoProjeto
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child:
                      const Loading(color: Colors.white, circleTimeSeconds: 2),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCampo("Nome", projeto.nome),
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildCampo("Descrição", projeto.descricao),
                    buildCampo("Email", projeto.email),
                    buildCampo("Telefone", projeto.telefone.toString()),
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildCampo(
                        "Rua",
                        projeto.endereco.rua +
                            " " +
                            projeto.endereco.numero.toString()),
                    buildCampo("Telefone", projeto.endereco.cep.toString()),
                    buildCampo("Telefone", projeto.endereco.bairro),
                    buildCampo("Telefone", projeto.endereco.cidade),
                    buildCampo("Telefone", projeto.endereco.estado),
                    projeto.aprovado
                        ? buildCampo(
                            "Aprovado em", diaComAno(projeto.entradaEm!))
                        : buildCampo("Aprovado", "Não"),
                    buildCampo("Requisição entrada",
                        diaComAno(projeto.requisicaoEntradaEm)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    !projeto.aprovado
                        ? TextButton(
                            onPressed: () {
                              controller.aprovarProjeto(projeto);
                            },
                            child: const Text("Aprovar"),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(10.0),
                              primary: Colors.white,
                              backgroundColor: Colors.green,
                              onSurface: Colors.grey,
                              textStyle: const TextStyle(fontSize: 17.0),
                            ),
                          )
                        : Container(),
                    TextButton(
                      onPressed: () {
                        Get.back();
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
                ),
        ),
      ),
    );
  }
}

class ViewProjeto extends StatelessWidget {
  final AdministracaoController controller;
  final LoginController loginController;

  const ViewProjeto({
    required this.controller,
    required this.loginController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  : GenericListView<CodigoEntrada>(
                      shrinkWrap: true,
                      paddingLeft: 0.0,
                      paddingRight: 0.0,
                      itens: controller.codigosDeEntrada,
                      render: (CodigoEntrada codigoEntrada, index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PopUpVisualizarCodigoDeEntrada(
                                  codigoEntrada: codigoEntrada,
                                );
                              },
                            );
                          },
                          child: IconLabelDescriptionCard(
                            value: IconLabelDescriptionCardProps(
                              base64Image: controller.projeto.imgProjeto,
                              label: codigoEntrada.tipo ==
                                      TipoCodigoDeEntrada.Aluno
                                  ? "Código Aluno"
                                  : "Código Professor",
                              description: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      loginController.authInfo.projeto!.cursos
                                          .firstWhere((element) =>
                                              element.id ==
                                              codigoEntrada.idCurso)
                                          .nome,
                                      textScaleFactor: 0.6,
                                    ),
                                  ),
                                  Text(
                                    "Gerado em: " +
                                        diaComAno(codigoEntrada.geradoEm) +
                                        " " +
                                        horario(codigoEntrada.geradoEm),
                                    textScaleFactor: 0.6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }

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
                                    style: const TextStyle(fontSize: 15.0),
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

class PopUpVisualizarCodigoDeEntrada extends StatelessWidget {
  final CodigoEntrada codigoEntrada;
  final loginController = Get.find<LoginController>();
  Curso? curso;
  Materia? materia;
  PopUpVisualizarCodigoDeEntrada({required this.codigoEntrada, Key? key})
      : super(key: key) {
    Projeto projeto = loginController.authInfo.projeto!;

    try {
      curso = projeto.cursos
          .firstWhere((element) => element.id == codigoEntrada.idCurso);
    } catch (e) {}

    if (codigoEntrada.idMateria != null && curso != null) {
      try {
        materia = curso!.materias
            .firstWhere((element) => element.id == codigoEntrada.idMateria);
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Código de entrada"),
      content: SizedBox(
          height: 450.0,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                codigoEntrada.tipo == TipoCodigoDeEntrada.Aluno
                    ? "Código aluno"
                    : "Código Professor",
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(curso != null ? "Curso: " + curso!.nome : "Curso: ??"),
              codigoEntrada.idMateria != null
                  ? Text(
                      materia != null
                          ? "Matéria: " + materia!.nome
                          : "Matéria: ??",
                    )
                  : Container(),
              const SizedBox(
                height: 10.0,
              ),
              QrImage(
                data: codigoEntrada.id,
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
                          codigoEntrada.id,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: codigoEntrada.id,
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
                  Get.back();
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
          )),
    );
  }
}
