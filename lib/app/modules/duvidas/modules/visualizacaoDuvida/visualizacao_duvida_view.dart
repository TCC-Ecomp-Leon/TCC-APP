import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/duvidas/modules/visualizacaoDuvida/visualizacao_duvida_controller.dart';
import 'package:tcc_app/models/Duvida.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/shimmer_loading_mask.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VisualizacaoDuvidaView extends GetView<VisualizacaoDuvidaController> {
  Widget buildMensagem(String mensagem, DateTime horarioMensagem) {
    BubbleStyle styleAdm = const BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Colors.blueAccent,
      borderColor: Colors.white,
      borderWidth: 1,
      elevation: 4,
      margin: BubbleEdges.only(top: 8, left: 50),
      alignment: Alignment.topRight,
    );

    return ListView(
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
            horario(horarioMensagem) + " do dia " + diaMes(horarioMensagem),
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
    );
  }

  Widget buildEnviarMensagem(bool enviando, String? erro) {
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
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: height - bottomInsets - 112.0,
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
                          );
                        },
                      ),
                    ),
                  ),
                  buildEnviarMensagem(
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
