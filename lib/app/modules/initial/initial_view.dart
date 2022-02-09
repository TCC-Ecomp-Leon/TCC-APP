import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/initial/initial_controller.dart';
import 'package:tcc_app/widgets/loading.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Grabalho de graduação",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Leon Tenório da Silva",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Engenharia de Computação",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "2º semestre de 2021",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Fevereiro de 2022",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Orientador: Tiago Silva da Silva",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: const Loading(
                    color: Colors.red,
                    circleTimeSeconds: 1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(100),
            child: Image.network(
              'https://www.unifesp.br/reitoria/dci/images/docs/manual_da_marca/Unifesp_simples_policromia_RGB.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
