import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/colaboracao/colaboracao_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/widgets/carousel_indicator.dart';
import 'package:tcc_app/widgets/icon_label_description_card.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

class ColaboracaoView extends GetView<ColaboracaoController> {
  RefreshController refreshControllerCursos = RefreshController();
  RefreshController refreshControllerColaboracoesFeiras = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 10.0,
          right: 10.0,
        ),
        child: CarouselIndicator(
          children: [
            Obx(
              () => ColaboracaoRefreshViewList(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0.0),
                  itemCount: controller.cursos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildCurso(
                      context,
                      controller.cursos[index],
                      refreshControllerCursos,
                    );
                  },
                ),
                loading: controller.carregandoCursos,
                header: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Cursos para colaborar",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomOffset: 170.0,
                onRefreshColaboracoes: (refreshController) =>
                    controller.carregarCursos(
                  refreshController: refreshController,
                ),
              ),
            ),
            Obx(
              () => ColaboracaoRefreshViewList(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0.0),
                  itemCount: controller.colaboracoes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildColaboracao(
                      context,
                      controller.colaboracoes[index],
                      index,
                    );
                  },
                ),
                loading: controller.carregandoAtividadesColaboradas,
                header: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Atividades que colaborou",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomOffset: 170.0,
                onRefreshColaboracoes: (refreshController) =>
                    controller.carregarColaboracoes(
                  refreshController: refreshController,
                ),
              ),
            ),
          ],
        ),
      ),
      controller: controller,
    );
  }

  Widget buildCurso(BuildContext context, InformacoesCursoProjeto info,
      RefreshController refreshController) {
    return InkWell(
      onTap: () async {
        await Get.toNamed(
          Routes.visualizacaoCurso,
          arguments: info.curso,
        );
        controller.carregarCursos(
          refreshController: refreshController,
        );
      },
      child: IconLabelDescriptionCard(
        value: IconLabelDescriptionCardProps(
          base64Image: info.imagemProjeto,
          label: info.nomeProjeto,
          description: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                info.curso.nome,
                textScaleFactor: 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColaboracao(
      BuildContext context, ColaboracaoAtividade colaboracao, int index) {
    return InkWell(
      onTap: () {
        controller.carregarAtividadeColaborada(
          colaboracao,
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return PopUpAtividadeColaborada(
              controller: controller,
            );
          },
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(colaboracao.horas.toStringAsFixed(2) + " horas"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef OnRefreshColaboracoes = void Function(
  RefreshController refreshController,
);

class ColaboracaoRefreshViewList extends StatelessWidget {
  final Widget child;
  final bool loading;
  final Widget header;
  final double bottomOffset;
  final OnRefreshColaboracoes onRefreshColaboracoes;

  const ColaboracaoRefreshViewList({
    required this.child,
    required this.loading,
    required this.header,
    required this.bottomOffset,
    required this.onRefreshColaboracoes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = RefreshController();
    if (loading) {
      return Container(
        alignment: Alignment.center,
        height: 90.0,
        child: const Loading(
          color: Colors.white,
          circleTimeSeconds: 2,
        ),
      );
    }
    return RefreshListView(
      header: header,
      bottomOffset: bottomOffset,
      refreshController: refreshController,
      onRefresh: () => onRefreshColaboracoes(refreshController),
      child: child,
    );
  }
}

class PopUpAtividadeColaborada extends StatelessWidget {
  final ColaboracaoController controller;
  const PopUpAtividadeColaborada({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Atividade colaborada"),
      content: Obx(
        () => SizedBox(
          height: 300.0,
          width: MediaQuery.of(context).size.width * 0.9,
          child: controller.carregandoAtividadesColaboradas
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child:
                      const Loading(color: Colors.white, circleTimeSeconds: 2),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCampo(
                      "Nome Projeto",
                      controller.atividadeColaboradaCarregada.nomeProjeto,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildCampo(
                      "Nome Atividade",
                      controller.atividadeColaboradaCarregada.atividade.nome,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildCampo(String nomeCampo, String? campo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nomeCampo + ":",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(campo ?? ""),
      ],
    );
  }
}
