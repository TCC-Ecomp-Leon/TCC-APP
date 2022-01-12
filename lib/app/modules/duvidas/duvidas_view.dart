import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_controller.dart';
import 'package:tcc_app/screens/dummy.dart';

class DuvidasView extends GetView<DuvidasController> {
  Widget buildCriarDuvida(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return GestureDetector(
      onTap: () {},
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
                    child: const Text("Criar dúvida"),
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
              buildCriarDuvida(context),
              Obx(
                () => controller.duvidas.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height - 200.0,
                        child: const Center(
                          child: Text("Nenhuma dúvida"),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 0.0),
                        itemCount: controller.duvidas.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container();
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
