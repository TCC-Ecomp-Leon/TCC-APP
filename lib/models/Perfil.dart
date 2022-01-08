import './Curso.dart';
import './Materia.dart';
import './CursoUniversitario.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Perfil.freezed.dart';
part 'Perfil.g.dart';

@freezed
abstract class Perfil with _$Perfil {
  const factory Perfil(
    String id,
    String email,
    String nome,
    String telefone,
    DateTime entradaEm,
    String fotoPerfil,
    RegraPerfil regra,
    String? cpf,
    PerfilAssociacoes? associacoes,
    InformacoesUniversitario? universitario,
  ) = _Perfil;

  factory Perfil.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$PerfilFromJson(
        json
      );
}

@freezed
abstract class PerfilAssociacoes with _$PerfilAssociacoes {
  const factory PerfilAssociacoes(
    InformacoesCurso aluno,
    InformacoesProfessor professor,
  ) = _PerfilAssociacoes;

  factory PerfilAssociacoes.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$PerfilAssociacoesFromJson(
        json
      );
}

@freezed
abstract class InformacoesCurso with _$InformacoesCurso {
  const factory InformacoesCurso(
    bool alunoParceiro,
    List<Curso>? cursos,
  ) = _InformacoesCurso;

  factory InformacoesCurso.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$InformacoesCursoFromJson(
        json
      );
}

@freezed
abstract class InformacoesProfessor with _$InformacoesProfessor {
  const factory InformacoesProfessor(
    bool professor,
    List<Materia>? materiasProfessor,
  ) = _InformacoesProfessor;

  factory InformacoesProfessor.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$InformacoesProfessorFromJson(
        json
      );
}

@freezed
abstract class InformacoesUniversitario with _$InformacoesUniversitario {
  const factory InformacoesUniversitario(
    bool universitario,
    String? email,
    InformacoesUniversitarioGraduacao? graduacao,
    List<ColaboracaoAtividade>? atividadesQueColaborou,
  ) = _InformacoesUniversitario;

  factory InformacoesUniversitario.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$InformacoesUniversitarioFromJson(
        json
      );
}

@freezed
abstract class InformacoesUniversitarioGraduacao with _$InformacoesUniversitarioGraduacao {
  const factory InformacoesUniversitarioGraduacao(
    DateTime atualizadoEm,
    CursoUniversitario curso,
  ) = _InformacoesUniversitarioGraduacao;

  factory InformacoesUniversitarioGraduacao.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$InformacoesUniversitarioGraduacaoFromJson(
        json
      );
}

@freezed
abstract class ColaboracaoAtividade with _$ColaboracaoAtividade {
  const factory ColaboracaoAtividade(
    String idResposta,
    String idAtividade,
    double horas,
    bool aprovado,
    bool? horasEmitidas,
  ) = _ColaboracaoAtividade;

  factory ColaboracaoAtividade.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$ColaboracaoAtividadeFromJson(
        json
      );
}

enum RegraPerfil {
  @JsonValue(1)
  Administrador,
  @JsonValue(2)
  Projeto,
  @JsonValue(3)
  Geral,
}