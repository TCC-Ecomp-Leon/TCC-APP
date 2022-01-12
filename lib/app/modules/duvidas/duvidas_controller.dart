import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/models/Duvida.dart';
import 'package:tcc_app/services/duvida.dart';

class DuvidasController extends BottomMenuController {
  final RxList<dynamic> _duvidas = [].obs;

  @override
  void onInit() {
    super.onInit();
    carregarDuvidas();
  }

  carregarDuvidas() async {
    List<Duvida>? result = await obterDuvidas(null);
    if (result != null) {
      _duvidas.value = result;
      _duvidas.refresh();
    }
  }

  List<Duvida> get duvidas => _duvidas.value as List<Duvida>;
}
