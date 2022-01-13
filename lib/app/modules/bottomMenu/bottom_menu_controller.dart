import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_view.dart';
import 'package:tcc_app/app/modules/perfil/perfil_view.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/config/constants.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/screens/dummy.dart';

class BottomMenuInfo {
  int? tabIndex;
  String? routeName;

  BottomMenuInfo({
    required this.tabIndex,
    required this.routeName,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['tab_index'] = tabIndex;
    json['route_name'] = routeName;

    return json;
  }

  BottomMenuInfo.fromJson(Map<String, dynamic> json) {
    tabIndex = json['tab_index'];
    routeName = json['route_name'];
  }
}

class BottomMenuController extends GetxController {
  final loginController = Get.find<LoginController>();
  final Rx<int> _tabIndex = 0.obs;

  List<BottomMenuPage> pageList = [];

  final box = GetStorage(Constants.storageBox);

  @override
  void onInit() {
    pageList = obterPaginasComPermisssao(loginController);

    BottomMenuInfo? read = readBottomMenuInfo(box);
    if (read != null && read.tabIndex != null) {
      _tabIndex.value = read.tabIndex!;
    }

    super.onInit();
  }

  void setPage(int index) {
    _tabIndex.value = index;
    writeBottomMenuInfo(
      box,
      BottomMenuInfo(
        routeName: pageList[index].routeName,
        tabIndex: index,
      ),
    );
    Get.offAllNamed(pageList[index].routeName);
  }

  int get tabIndex => _tabIndex.value;
}

BottomMenuInfo? readBottomMenuInfo(GetStorage box) {
  try {
    Map<String, dynamic> read = box.read(Constants.navigationMenuBoxKey);
    if (box != null) {
      return BottomMenuInfo.fromJson(read);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<void> writeBottomMenuInfo(GetStorage box, BottomMenuInfo info) async {
  await box.write(Constants.navigationMenuBoxKey, info.toJson());
}

Future<void> clearBottomMenuInfo(GetStorage box) async {
  await box.remove(Constants.navigationMenuBoxKey);
}

List<BottomMenuPage> obterPaginasComPermisssao(
    LoginController loginController) {
  final Perfil? perfil = loginController.authInfo.perfil;
  if (perfil == null) {
    loginController.signOut();
  }

  if (perfil!.regra == RegraPerfil.Geral) {
    return [pages[1], pages[2], pages[3], pages[4]];
  } else if (perfil.regra == RegraPerfil.Projeto) {
    return [pages[0], pages[1], pages[3], pages[4]];
  }

  return pages;
}

final List<BottomMenuPage> pages = [
  BottomMenuPage(
    page: const Dummy(),
    label: "Administração",
    icon: const Icon(Icons.admin_panel_settings),
    routeName: Routes.administracao,
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
    page: DuvidasView(),
    label: "Dúvidas",
    icon: const Icon(Icons.question_answer),
    routeName: Routes.duvidas,
  ),
  BottomMenuPage(
    page: PerfilView(),
    label: "Perfil",
    icon: const Icon(Icons.person),
    routeName: Routes.perfil,
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
