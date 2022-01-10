import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/config/constants.dart';

class InitialController extends GetxController {
  final box = GetStorage(Constants.storageBox);

  String navigateAfterSplashTime() {
    return Routes.login;
  }
}
