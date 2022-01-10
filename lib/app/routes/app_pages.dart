import 'package:tcc_app/app/modules/initial/initial_binding.dart';
import 'package:tcc_app/app/modules/initial/initial_view.dart';
import 'package:tcc_app/app/modules/signIn/login_binding.dart';
import 'package:tcc_app/app/modules/signIn/login_view.dart';
import 'package:tcc_app/app/modules/signUp/signup_binding.dart';
import 'package:tcc_app/app/modules/signUp/signup_view.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.initial;

  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}