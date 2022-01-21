import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/duvidas/modules/visualizacaoDuvida/visualizacao_duvida_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/base64_image.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/shimmer_loading_mask.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VisualizacaoDuvidaView extends GetView<VisualizacaoDuvidaController> {
  final LoginController loginController = Get.find<LoginController>();

  Widget buildRemetenteMensagem(String idPerfil) {
    if (controller.carregandoPerfis) {
      return Transform.scale(
        scale: 0.5,
        child: Container(
          alignment: Alignment.center,
          child: const Loading(color: Colors.white, circleTimeSeconds: 2),
        ),
      );
    }

    Perfil? perfil = controller.perfisMensagens[idPerfil];
    if (perfil == null) {
      return const Icon(
        Icons.info,
        color: Colors.red,
        size: 20.0,
      );
    } else {
      bool propriaMensagem = perfil.id == loginController.perfil.id;
      return Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 3.0,
                ),
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      imageFromBase64String(perfil.fotoPerfil).image,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  perfil.regra == RegraPerfil.Administrador
                      ? "G"
                      : perfil.regra == RegraPerfil.Projeto
                          ? "P"
                          : perfil.associacoes!.professor.professor
                              ? "P"
                              : perfil.universitario!.universitario
                                  ? "U"
                                  : "A",
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.black,
                  ),
                ),
                radius: 6.0,
              ),
            ],
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                propriaMensagem
                    ? "Você"
                    : textoParaTamanhoFixo(
                        perfil.nome,
                        20,
                      ),
                textScaleFactor: 0.5,
              ),
            ),
          )
        ],
      );
    }
  }

  Widget buildMensagem(
      String mensagem, DateTime horarioMensagem, String idPerfil) {
    BubbleStyle styleAdm = const BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Colors.blueAccent,
      borderColor: Colors.white,
      borderWidth: 1,
      elevation: 4,
      margin: BubbleEdges.only(top: 8, left: 50),
      alignment: Alignment.topRight,
    );

    return Row(
      children: [
        SizedBox(
          width: 50.0,
          child: Obx(() => buildRemetenteMensagem(idPerfil)),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Bubble(
                alignment: Alignment.center,
                color: Colors.greenAccent,
                borderColor: Colors.black,
                borderWidth: 2,
                margin: const BubbleEdges.only(top: 8),
                child: Text(
                  horario(horarioMensagem) +
                      " do dia " +
                      diaMes(horarioMensagem),
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
              Bubble(
                style: styleAdm,
                child: Text(
                  mensagem,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEnviarMensagem(bool fechada, bool enviando, String? erro) {
    if (fechada) {
      return Container();
    }
    return ShimmerLoading(
      isLoading: enviando,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            erro != null
                ? Container(
                    height: 18.0,
                    padding: const EdgeInsets.only(right: 40.0, bottom: 2.0),
                    child: Text(
                      erro,
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 18.0,
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
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            iconSize: 22.0,
                            color: Colors.amber,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller: controller.mensagem,
                              decoration: const InputDecoration(
                                hintText: 'Insira sua mensagem para o tópico',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {
                    controller.enviarMensagem();
                  },
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.send,
                      color: Colors.orange,
                    ),
                    backgroundColor: Colors.amberAccent,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {
                    controller.fechamentoDuvida();
                  },
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return KeyboardVisibilityBuilder(
      builder: (BuildContext context, bool isKeyboardVisible) {
        final double bottomInsets = isKeyboardVisible ? 250 : 0.0;
        final double bottomOffset = controller.duvida.resolvida ? 100 : 169;
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.black,
                        child: Center(
                          child: Icon(
                            Icons.question_answer,
                            color: Colors.white,
                          ),
                        ),
                        maxRadius: 20,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              controller.duvida.titulo,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              controller.duvida.resolvida
                                  ? "Status: Resolvida"
                                  : "Status: Em aberto",
                              style: TextStyle(
                                  color: controller.duvida.resolvida
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height - bottomInsets - bottomOffset,
                    child: SmartRefresher(
                      controller: controller.refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      header: const WaterDropHeader(),
                      onRefresh: () {
                        controller.atualizarDuvida();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 0.0),
                        itemCount: controller.duvida.mensagens.length,
                        itemBuilder: (BuildContext context, int index) {
                          DuvidaMensagem mensagem =
                              controller.duvida.mensagens[index];

                          return buildMensagem(
                            mensagem.mensagem,
                            mensagem.horario,
                            mensagem.idPerfil,
                          );
                        },
                      ),
                    ),
                  ),
                  buildEnviarMensagem(
                    controller.duvida.resolvida,
                    controller.enviandoMensagem,
                    controller.erro,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
