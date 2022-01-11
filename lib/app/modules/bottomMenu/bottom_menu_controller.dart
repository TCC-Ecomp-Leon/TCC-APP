import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/config/constants.dart';
import 'package:tcc_app/screens/dummy.dart';

class BottomMenuController extends GetxController {
  final loginController = Get.find<LoginController>();
  final Rx<int> _tabIndex = 0.obs;

  List<BottomMenuPage> pageList = [];

  final box = GetStorage(Constants.storageBox);

  @override
  void onInit() {
    pageList = obterPaginasComPermisssao(loginController);

    int? read = box.read(Constants.navigationMenuBoxKey);
    if (read != null) {
      _tabIndex.value = read;
    }

    super.onInit();
  }

  void setPage(int index) {
    _tabIndex.value = index;
    box.write(Constants.navigationMenuBoxKey, index);
    Get.offAllNamed(pageList[index].routeName);
  }

  int get tabIndex => _tabIndex.value;
}

List<BottomMenuPage> obterPaginasComPermisssao(
    LoginController loginController) {
  return pages;
}

final List<BottomMenuPage> pages = [
  BottomMenuPage(
    page: const Dummy(),
    label: "Administração",
    icon: const Icon(Icons.admin_panel_settings),
    routeName: Routes.dummy,
  ),
  BottomMenuPage(
    page: const Dummy(),
    label: "Cursos",
    icon: const Icon(Icons.list),
    routeName: Routes.dummy,
  ),
  BottomMenuPage(
    page: const Dummy(),
    label: "Colaboração",
    icon: const Icon(Icons.blur_circular_rounded),
    routeName: Routes.dummy,
  ),
  BottomMenuPage(
    page: const Dummy(),
    label: "Dúvidas",
    icon: const Icon(Icons.question_answer),
    routeName: Routes.dummy,
  ),
  BottomMenuPage(
    page: const Dummy(),
    label: "Perfil",
    icon: const Icon(Icons.person),
    routeName: Routes.dummy,
  ),
];

class BottomMenuPage {
  Widget page;
  String label;
  Icon icon;
  String routeName;

  BottomMenuPage({
    required this.page,
    required this.label,
    required this.icon,
    required this.routeName,
  });
}
