import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/config/constants.dart';

const int splashSecondsTime = 5;

class InitialController extends GetxController {
  final loginController = Get.find<LoginController>();
  final box = GetStorage(Constants.storageBox);

  String navigateAfterSplashTime() {
    clearBottomMenuInfo(box);
    return Routes.login;
  }

  @override
  void onInit() {
    super.onInit();
    tentativaReentradaComToken();
    clearCollections(box);
  }

  tentativaReentradaComToken() async {
    String? nextPage =
        await loginController.usarTokenEmCache(splashSecondsTime * 1000);
    if (nextPage != null) {
      Get.offAllNamed(nextPage);
    } else {
      Get.offAllNamed(navigateAfterSplashTime());
    }
  }

  int get splashTime => splashSecondsTime;
}
