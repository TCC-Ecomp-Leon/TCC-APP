import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/administracao/administracao_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/carousel_indicator.dart';
import 'package:tcc_app/widgets/dropdown.dart';
import 'package:tcc_app/widgets/icon_label_description_card.dart';
import 'package:tcc_app/widgets/label_description_card.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

class AdministracaoView extends GetView<AdministracaoController> {
  AdministracaoView({Key? key}) : super(key: key);

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
                        " " +
                        horario(projeto.entradaEm!)
                    : "Requisitado em: " +
                        diaComAno(projeto.requisicaoEntradaEm) +
                        " " +
                        horario(projeto.requisicaoEntradaEm),
                textScaleFactor: 0.6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNovoCursoUniversitario(
      BuildContext context, RefreshController refreshController) {
    final double width = MediaQuery.of(context).size.width * 0.9;
    return InkWell(
      onTap: () async {
        await Get.toNamed(Routes.adicaoCursoUniversitario);
        controller.carregarCursosUniversitarios(
          refreshController: refreshController,
        );
      },
      child: Column(
        children: [
          Card(
            color: Colors.green,
            child: Container(
              height: 70.0,
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 5.0,
                bottom: 5.0,
              ),
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
                    child: const Text("Criar curso"),
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

  Widget buildCursoUniversitario(
      BuildContext context, CursoUniversitario curso) {
    final double espacoDisponivel = MediaQuery.of(context).size.width - 50.0;
    return LabelDescriptionCard(
      value: LabelDescriptionCardProps(
        rightPadding: 10.0,
        leftPadding: 10.0,
        bottomPadding: 5.0,
        topPadding: 5.0,
        label: curso.nome,
        labelSufix: curso.semestresPrevistos.toString() + " semestres",
        description: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: espacoDisponivel,
              child: Text(
                curso.cursoAnterior != null
                    ? "Curso Anterior: " + curso.cursoAnterior!.nome
                    : "Curso Anterior: Nenhum",
                textScaleFactor: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RefreshController refreshControllerProjetosAprovados = RefreshController();
    RefreshController refreshControllerProjetosNaoAprovados =
        RefreshController();
    RefreshController refreshControllerCursosUniversitarios =
        RefreshController();
    return CarouselIndicator(
      children: [
        Obx(
          () => controller.carregandoProjetosAprovados
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child:
                      const Loading(color: Colors.white, circleTimeSeconds: 2),
                )
              : RefreshListView(
                  header: Column(
                    children: const [
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Projetos aprovados",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                  bottomOffset: 170.0,
                  refreshController: refreshControllerProjetosAprovados,
                  onRefresh: () {
                    controller.carregarProjetosAprovados(
                        refreshController: refreshControllerProjetosAprovados);
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0.0),
                    itemCount: controller.projetosAprovados.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildProjeto(
                        context,
                        controller.projetosAprovados[index],
                      );
                    },
                  ),
                ),
        ),
        Obx(
          () => controller.carregandoProjetosNaoAprovados
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child:
                      const Loading(color: Colors.white, circleTimeSeconds: 2),
                )
              : RefreshListView(
                  header: Column(
                    children: const [
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Projetos necessitando aprova????o",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                  bottomOffset: 170.0,
                  refreshController: refreshControllerProjetosNaoAprovados,
                  onRefresh: () {
                    controller.carregarProjetosNaoAprovados(
                        refreshController:
                            refreshControllerProjetosNaoAprovados);
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0.0),
                    itemCount: controller.projetosNaoAprovados.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildProjeto(
                        context,
                        controller.projetosNaoAprovados[index],
                      );
                    },
                  ),
                ),
        ),
        Obx(
          () => controller.carregandoCursosUniversitarios
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child:
                      const Loading(color: Colors.white, circleTimeSeconds: 2),
                )
              : RefreshListView(
                  header: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      buildNovoCursoUniversitario(
                        context,
                        refreshControllerCursosUniversitarios,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                  bottomOffset: 170.0,
                  refreshController: refreshControllerCursosUniversitarios,
                  onRefresh: () {
                    controller.carregarCursosUniversitarios(
                        refreshController:
                            refreshControllerCursosUniversitarios);
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0.0),
                    itemCount: controller.cursosUniversitarios.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildCursoUniversitario(
                        context,
                        controller.cursosUniversitarios[index],
                      );
                    },
                  ),
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
                    buildCampo("Descri????o", projeto.descricao),
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
                        : buildCampo("Aprovado", "N??o"),
                    buildCampo("Requisi????o entrada",
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
    RefreshController refreshControllerCodigosDeEntrada = RefreshController();
    return Obx(
      () => RefreshListView(
        header: buildCriarCodigoDeEntrada(
          context,
          refreshControllerCodigosDeEntrada,
        ),
        bottomOffset: 170.0,
        refreshController: refreshControllerCodigosDeEntrada,
        onRefresh: () {
          controller.carregarCodigosDeEntrada(
              refreshController: refreshControllerCodigosDeEntrada);
        },
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 0.0),
          itemCount: controller.codigosDeEntrada.length,
          itemBuilder: (BuildContext context, index) {
            CodigoEntrada codigoEntrada = controller.codigosDeEntrada[index];
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    controller.obterPerfil(codigoEntrada.idPerfilUsou);
                    return PopUpVisualizarCodigoDeEntrada(
                      codigoEntrada: codigoEntrada,
                      controller: controller,
                    );
                  },
                );
              },
              child: Opacity(
                opacity: codigoEntrada.usado ? 0.5 : 1.0,
                child: IconLabelDescriptionCard(
                  value: IconLabelDescriptionCardProps(
                    base64Image: controller.projeto.imgProjeto,
                    label: codigoEntrada.tipo == TipoCodigoDeEntrada.Aluno
                        ? "C??digo Aluno"
                        : "C??digo Professor",
                    description: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            loginController.authInfo.projeto!.cursos != null
                                ? loginController.authInfo.projeto!.cursos!
                                    .firstWhere((element) =>
                                        element.id == codigoEntrada.idCurso)
                                    .nome
                                : "??",
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
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildCriarCodigoDeEntrada(BuildContext context,
      RefreshController refreshControllerCodigosDeEntrada) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            controller.entrarEmModoDeAdicaoCodigo();
            return PopUpCriacaoCodigoDeEntrada(
              controller: controller,
              refreshControllerCodigosDeEntrada:
                  refreshControllerCodigosDeEntrada,
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
                    child: const Text("Criar c??digo de entrada"),
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
  final RefreshController refreshControllerCodigosDeEntrada;
  const PopUpCriacaoCodigoDeEntrada({
    required this.controller,
    required this.refreshControllerCodigosDeEntrada,
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
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Container(
                alignment: Alignment.centerRight,
                // width: 200.0,
                // padding: const EdgeInsets.only(
                //   right: 8.0,
                //   left: 8.0,
                // ),
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Novo c??digo de entrada"),
      content: SizedBox(
        height: 400.0,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Obx(
          () => controller.estadoAdicaoCodigo ==
                  EstadoAdicaoCodigoDeEntrada.carregando
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child: const Loading(
                    color: Colors.white,
                    circleTimeSeconds: 2,
                  ),
                )
              : controller.estadoAdicaoCodigo ==
                      EstadoAdicaoCodigoDeEntrada.adicionado
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "C??digo de entrada adicionado",
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
                            controller.sairModoAdicaoCodigo(
                                refreshControllerCodigosDeEntrada);
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
                                "Mat??ria",
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

// ignore: must_be_immutable
class PopUpVisualizarCodigoDeEntrada extends StatelessWidget {
  final CodigoEntrada codigoEntrada;
  final loginController = Get.find<LoginController>();
  final AdministracaoController controller;

  Curso? curso;
  Materia? materia;

  PopUpVisualizarCodigoDeEntrada({
    required this.codigoEntrada,
    required this.controller,
    Key? key,
  }) : super(key: key) {
    Projeto projeto = loginController.authInfo.projeto!;

    try {
      if (projeto.cursos != null) {
        curso = projeto.cursos!
            .firstWhere((element) => element.id == codigoEntrada.idCurso);
      }
      // ignore: empty_catches
    } catch (e) {}

    if (codigoEntrada.idMateria != null && curso != null) {
      try {
        materia = curso!.materias
            .firstWhere((element) => element.id == codigoEntrada.idMateria);
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("C??digo de entrada"),
      content: Obx(
        () => SizedBox(
          height: 500.0,
          width: MediaQuery.of(context).size.width * 0.9,
          child: controller.carregandoPerfil
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
                    Text(
                      codigoEntrada.tipo == TipoCodigoDeEntrada.Aluno
                          ? "C??digo aluno"
                          : "C??digo Professor",
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      codigoEntrada.usado
                          ? "Situa????o: Usado"
                          : "Situa????o: Ainda n??o usado",
                      style: const TextStyle(fontSize: 17.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    controller.perfilCarregado != null
                        ? Column(
                            children: [
                              const Text(
                                "Usado por: ",
                                style: TextStyle(fontSize: 17.0),
                              ),
                              Text(
                                controller.perfilCarregado!.nome,
                                style: const TextStyle(fontSize: 17.0),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          )
                        : Container(),
                    Text(curso != null ? "Curso: " + curso!.nome : "Curso: ??"),
                    codigoEntrada.idMateria != null
                        ? Text(
                            materia != null
                                ? "Mat??ria: " + materia!.nome
                                : "Mat??ria: ??",
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
                ),
        ),
      ),
    );
  }
}
