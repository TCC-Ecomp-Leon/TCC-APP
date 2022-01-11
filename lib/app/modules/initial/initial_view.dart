import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tcc_app/app/modules/initial/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen.timer(
            seconds: controller.splashTime,
            navigateAfterSeconds: controller.navigateAfterSplashTime(),
            title: const Text(
              'Splash Screen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            backgroundColor: Colors.white,
            loaderColor: Colors.red,
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
