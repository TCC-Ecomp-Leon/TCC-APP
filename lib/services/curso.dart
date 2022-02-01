import 'package:dio/dio.dart';
import 'package:tcc_app/models/Materia.dart';
import 'package:tcc_app/services/Endpoints.dart';

import './requests/dio.dart';

Future<bool?> adicionarCurso(
  String idProjeto,
  String nome,
  String descricao,
  DateTime inicioCurso,
  DateTime fimCurso,
  List<Materia> materias,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.cursoEndpoint + "/" + idProjeto,
        data: {
          'nome': nome,
          'descricao': descricao,
          'inicioCurso': inicioCurso.toString(),
          'fimCurso': fimCurso.toString(),
          'materias': materias.map((e) => e.toJson()).toList(),
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> atualizarCurso(
  String idProjeto,
  String idCurso,
  String? nome,
  String? descricao,
  DateTime? inicioCurso,
  DateTime? fimCurso,
  List<Materia>? materias,
) {
  return executeRequest(
    () {
      Map<String, dynamic> camposAtualizacao = {};
      if (nome != null) {
        camposAtualizacao['nome'] = nome;
      }
      if (descricao != null) {
        camposAtualizacao['descricao'] = descricao;
      }
      if (inicioCurso != null) {
        camposAtualizacao['inicioCurso'] = inicioCurso.toString();
      }
      if (fimCurso != null) {
        camposAtualizacao['fimCurso'] = fimCurso.toString();
      }
      if (materias != null) {
        camposAtualizacao['materias'] =
            materias.map((e) => e.toJson()).toList();
      }
      return httpClient.request(
        Endpoints.cursoEndpoint + "/" + idProjeto + "/" + idCurso,
        data: camposAtualizacao,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
