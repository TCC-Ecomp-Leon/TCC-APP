import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/perfil.dart';
import 'package:tcc_app/services/respostaAtividade.dart';

class RespostasController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    atividade = Get.arguments['atividade'] as Atividade;
    curso = Get.arguments['curso'] as Curso;
    _carregando.value = true;
    carregarRespostas();
  }

  final LoginController loginController = Get.find<LoginController>();

  late Atividade atividade;
  late Curso curso;

  late RxList<RespostasControllerInformacaoAluno> _respostas;
  final Rx<bool> _carregando = false.obs;
  final Rx<String> _erro = "".obs;

  final RefreshController refreshController = RefreshController();

  carregarRespostas({bool? pullRefresh}) async {
    if (pullRefresh != null && pullRefresh) {
      refreshController.requestRefresh();
    } else {
      _carregando.value = true;
    }

    List<Perfil> perfisCurso = await _listaDeAlunosCurso();
    List<RespostaAtividade>? respostas =
        await listarRespostas(atividade.idProjeto, atividade.id);
    if (respostas == null) {
      _erro.value = "Erro ao carregar as respostas da atividade";
    } else {
      _erro.value = "";
    }

    List<RespostasControllerInformacaoAluno> list = [];

    if (respostas != null) {
      for (int i = 0; i < perfisCurso.length; i++) {
        final Perfil perfil = perfisCurso[i];

        List<RespostaAtividade> respostasAluno =
            respostas.where((element) => element.idAluno == perfil.id).toList();
        final bool respondeu = respostasAluno.isNotEmpty;
        list.add(
          RespostasControllerInformacaoAluno(
            perfil: perfil,
            respondeu: respondeu,
            resposta: respondeu ? respostasAluno[0] : null,
          ),
        );
      }
    }

    _respostas = list.obs;

    if (pullRefresh != null && pullRefresh) {
      refreshController.refreshCompleted();
    } else {
      _carregando.value = false;
    }
  }

  bool atividadeCorrigida(RespostaAtividade? respostaAtividade) {
    if (respostaAtividade == null) {
      return false;
    } else {
      if (respostaAtividade.tipo == TipoAtividade.Alternativa) {
        return respostaAtividade.encerrada!;
      } else {
        return respostaAtividade.corrigida ?? false;
      }
    }
  }

  String notaCorrecao(RespostaAtividade? respostaAtividade) {
    if (respostaAtividade == null) {
      return "??";
    } else {
      return respostaAtividade.nota?.toStringAsFixed(2) ?? "??";
    }
  }

  Future<List<Perfil>> _listaDeAlunosCurso() async {
    List<Perfil> ret = [];

    for (int i = 0; i < curso.turma.length; i++) {
      final Perfil? perfil = await obterOutroPerfil(curso.turma[i]);
      if (perfil == null) {
        _erro.value = "Erro ao carregar o perfil " + curso.turma[i];
      }
      ret.add(perfil!);
    }

    return ret;
  }

  bool get carregando => _carregando.value;
  // ignore: invalid_use_of_protected_member
  List<RespostasControllerInformacaoAluno> get respostas => _respostas.value;
  String? get erro => _erro.value.isEmpty ? null : _erro.value;
}

class RespostasControllerInformacaoAluno {
  Perfil perfil;
  bool respondeu;
  RespostaAtividade? resposta;

  RespostasControllerInformacaoAluno({
    required this.perfil,
    required this.respondeu,
    required this.resposta,
  });
}
