import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/config/constants.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/cursoUniversitario.dart';
import 'package:tcc_app/services/perfil.dart';
import 'package:tcc_app/services/projeto.dart';
import '../../modules/signIn/login_controller.dart';

class CollectionsController extends GetxController {
  final box = GetStorage(Constants.storageBox);
  final loginController = Get.find<LoginController>();

  final Rx<bool> _carregandoProjetos = false.obs;
  final Rx<bool> _carregandoCursosUniversitarios = false.obs;
  final Rx<bool> _carregandoUsuarios = false.obs;
  final Rx<ProjetosCarregados> _projetosCarregados =
      ProjetosCarregados(projetos: []).obs;
  final Rx<UsuariosCarregados> _usuariosCarregados =
      UsuariosCarregados(usuarios: []).obs;
  final Rx<CursosUniversitariosCarregados> _cursosUniversitariosCarregados =
      CursosUniversitariosCarregados(cursosUniversitarios: []).obs;

  @override
  void onInit() {
    _projetosCarregados.value = ProjetosCarregados.fromStorage(
      box: box,
    );
    _usuariosCarregados.value = UsuariosCarregados.fromStorage(
      box: box,
    );
    _cursosUniversitariosCarregados.value =
        CursosUniversitariosCarregados.fromStorage(
      box: box,
    );

    super.onInit();
  }

  carregarCursosUniversitarios() async {
    _carregandoCursosUniversitarios.value = true;

    List<CursoUniversitario>? result = await obterCursosUniversitarios();
    if (result != null) {
      _cursosUniversitariosCarregados.value = CursosUniversitariosCarregados(
        cursosUniversitarios: result,
      );
      _cursosUniversitariosCarregados.value.save(box);
    }

    _carregandoCursosUniversitarios.value = false;
  }

  Future<void> carregarProjetos() async {
    _carregandoProjetos.value = true;

    List<Projeto>? result = await obterProjetos();
    if (result != null) {
      _projetosCarregados.value = ProjetosCarregados(
        projetos: result,
      );
    }

    _carregandoProjetos.value = false;
  }

  carregarUsuario(String idUsuario, bool force) async {
    _carregandoUsuarios.value = true;

    if (force || _usuariosCarregados.value.getItem(idUsuario) == null) {
      Perfil? result = await obterOutroPerfil(idUsuario);
      if (result != null) {
        List<Perfil> listaAnterior =
            _usuariosCarregados.value.getItems().map((e) => e.usuario).toList();
        int indexOf =
            listaAnterior.indexWhere((element) => element.id == idUsuario);
        if (indexOf > -1) {
          listaAnterior.removeAt(indexOf);
        }
        _usuariosCarregados.value = UsuariosCarregados(
          usuarios: [
            ...listaAnterior,
            result,
          ],
        );

        _usuariosCarregados.value.save(box);
      }
    }

    _carregandoUsuarios.value = false;
  }

  carregarProjeto(String idProjeto, bool force) async {
    _carregandoProjetos.value = true;

    if (force || _projetosCarregados.value.getItem(idProjeto) == null) {
      Projeto? result = await obterProjeto(idProjeto);
      if (result != null) {
        List<Projeto> listaAnterior =
            _projetosCarregados.value.getItems().map((e) => e.projeto).toList();
        int indexOf =
            listaAnterior.indexWhere((element) => element.id == idProjeto);
        if (indexOf > -1) {
          listaAnterior.removeAt(indexOf);
        }
        _projetosCarregados.value = ProjetosCarregados(
          projetos: [
            ...listaAnterior,
            result,
          ],
        );

        _projetosCarregados.value.save(box);
      }
    }

    _carregandoProjetos.value = false;
  }

  bool get carregandoUsuario => _carregandoUsuarios.value;
  bool get carregandoProjetos => _carregandoProjetos.value;
  bool get carregandoCursosUniversitarios =>
      _carregandoCursosUniversitarios.value;

  ProjetosCarregados get projetosCarregados => _projetosCarregados.value;
  UsuariosCarregados get usuariosCarregados => _usuariosCarregados.value;
  CursosUniversitariosCarregados get cursosCarregados =>
      _cursosUniversitariosCarregados.value;

  List<Projeto> get projetos =>
      _projetosCarregados.value.getItems().map((e) => e.projeto).toList();

  List<Curso>? _getCursosAluno() {
    Perfil perfil = loginController.perfil;
    if (perfil.regra != RegraPerfil.Geral) {
      return null;
    }

    if (perfil.associacoes == null ||
        !perfil.associacoes!.aluno.alunoParceiro) {
      return null;
    }
    return perfil.associacoes!.aluno.cursos;
  }

  List<Curso>? get getCursosAluno => _getCursosAluno();
  List<CursoUniversitario> get cursosUniversitarios =>
      _cursosUniversitariosCarregados.value
          .getItems()
          .map((e) => e.cursoUniversitario)
          .toList();

  Projeto? _obterProjeto(String id) {
    ProjetoItem? projetoItem = _projetosCarregados.value.getItem(id);
    if (projetoItem != null) return projetoItem.projeto;
    return null;
  }

  Curso? obterCurso(String id, String? idProjeto) {
    List<Curso> cursos = [];
    if (idProjeto != null) {
      Projeto? projeto = _obterProjeto(idProjeto);
      if (projeto == null) return null;

      if (projeto.cursos == null) return null;
      cursos = projeto.cursos!;
    } else {
      List<ProjetoItem> projetosItems = _projetosCarregados.value.getItems();
      List<Curso> cursos = [];
      for (var element in projetosItems) {
        if (element.projeto.cursos != null) {
          cursos = [...cursos, ...element.projeto.cursos!];
        }
      }
    }

    final int indexOf = cursos.indexWhere((element) => element.id == id);
    if (indexOf < 0) return null;

    return cursos[indexOf];
  }

  Materia? obterMateria(String id, String idCurso, String? idProjeto) {
    Curso? curso = obterCurso(idCurso, idProjeto);

    if (curso == null) return null;

    List<Materia> materias = curso.materias;

    final int indexOf = materias.indexWhere((element) => element.id == id);
    if (indexOf < 0) return null;

    return materias[indexOf];
  }
}

clearCollections(GetStorage box) async {
  await box.remove(Constants.collectionsCursosUniversitariosKey);
  await box.remove(Constants.collectionsProjetosKey);
  await box.remove(Constants.collectionsUsuariosKeys);
}

class UsuariosCarregados extends CollectionCarregada<UsuarioItem> {
  UsuariosCarregados({required List<Perfil> usuarios})
      : super(
          collection:
              usuarios.map((usuario) => UsuarioItem(usuario: usuario)).toList(),
          collectionItemCreator: () => UsuarioItem(),
          storageKey: Constants.collectionsUsuariosKeys,
        );
  UsuariosCarregados.fromStorage({required GetStorage box})
      : super.fromStorage(
          box: box,
          collectionItemCreator: () => UsuarioItem(),
          storageKey: Constants.collectionsUsuariosKeys,
        );
}

class UsuarioItem implements CollectionItem {
  late Perfil usuario;

  UsuarioItem({Perfil? usuario}) {
    if (usuario != null) {
      this.usuario = usuario;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return usuario.toJson();
  }

  @override
  fromJson(Map<String, dynamic> json) {
    usuario = Perfil.fromJson(json);
  }

  @override
  String get id => usuario.id;
}

class CursosUniversitariosCarregados
    extends CollectionCarregada<CursoUniversitarioItem> {
  CursosUniversitariosCarregados(
      {required List<CursoUniversitario> cursosUniversitarios})
      : super(
          collection: cursosUniversitarios
              .map((curso) => CursoUniversitarioItem(cursoUniversitario: curso))
              .toList(),
          collectionItemCreator: () => CursoUniversitarioItem(),
          storageKey: Constants.collectionsCursosUniversitariosKey,
        );
  CursosUniversitariosCarregados.fromStorage({required GetStorage box})
      : super.fromStorage(
          box: box,
          collectionItemCreator: () => CursoUniversitarioItem(),
          storageKey: Constants.collectionsCursosUniversitariosKey,
        );
}

class CursoUniversitarioItem implements CollectionItem {
  late CursoUniversitario cursoUniversitario;

  CursoUniversitarioItem({CursoUniversitario? cursoUniversitario}) {
    if (cursoUniversitario != null) {
      this.cursoUniversitario = cursoUniversitario;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return cursoUniversitario.toJson();
  }

  @override
  fromJson(Map<String, dynamic> json) {
    cursoUniversitario = CursoUniversitario.fromJson(json);
  }

  @override
  String get id => cursoUniversitario.id;
}

class ProjetosCarregados extends CollectionCarregada<ProjetoItem> {
  ProjetosCarregados({required List<Projeto> projetos})
      : super(
          collection:
              projetos.map((projeto) => ProjetoItem(projeto: projeto)).toList(),
          collectionItemCreator: () => ProjetoItem(),
          storageKey: Constants.collectionsProjetosKey,
        );
  ProjetosCarregados.fromStorage({required GetStorage box})
      : super.fromStorage(
          box: box,
          collectionItemCreator: () => ProjetoItem(),
          storageKey: Constants.collectionsProjetosKey,
        );
}

class ProjetoItem implements CollectionItem {
  late Projeto projeto;

  ProjetoItem({Projeto? projeto}) {
    if (projeto != null) {
      this.projeto = projeto;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return projeto.toJson();
  }

  @override
  fromJson(Map<String, dynamic> json) {
    projeto = Projeto.fromJson(json);
  }

  @override
  String get id => projeto.id;
}

typedef CollectionItemCreator<T> = T Function();

abstract class CollectionItem {
  String get id;

  Map<String, dynamic> toJson();
  fromJson(Map<String, dynamic> json);
}

class CollectionCarregada<T extends CollectionItem> {
  late Map<String, T> _collection;
  CollectionItemCreator<T> collectionItemCreator;
  String storageKey;

  CollectionCarregada({
    required List<T> collection,
    required this.collectionItemCreator,
    required this.storageKey,
  }) {
    _collection = {};
    for (int i = 0; i < collection.length; i++) {
      final item = collection[i];
      _collection[item.id] = item;
    }
  }

  T? getItem(String id) {
    List<String> keys = _collection.keys.toList();
    if (keys.contains(id)) {
      return _collection[id];
    }
    return null;
  }

  List<T> getItems() {
    List<T> items = [];

    _collection.forEach((key, value) {
      items.add(value);
    });

    return items;
  }

  Map<String, dynamic> _toJson() {
    Map<String, dynamic> json = {};

    _collection.forEach((key, value) {
      json[key] = value.toJson();
    });

    return json;
  }

  _fromJson(Map<String, dynamic> json) {
    _collection = {};

    json.forEach((key, value) {
      T item = collectionItemCreator();
      item.fromJson(value);
      _collection[key] = item;
    });
  }

  CollectionCarregada.fromStorage({
    required GetStorage box,
    required this.collectionItemCreator,
    required this.storageKey,
  }) {
    Map<String, dynamic>? read = box.read(storageKey);

    if (read != null) {
      _fromJson(read);
    } else {
      _collection = {};
    }
  }

  save(GetStorage box) async {
    await box.write(storageKey, _toJson());
  }
}
