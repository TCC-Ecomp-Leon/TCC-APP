import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_view.dart';
import 'package:tcc_app/app/modules/dummy/dummy_controller.dart';
import 'package:tcc_app/screens/dummy.dart';

class DummyView extends GetView<DummyController> {
  @override
  Widget build(BuildContext context) {
    return BottomMenuView(
      child: const Dummy(),
      controller: controller,
    );
  }
}
