// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Perfil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Perfil _$$_PerfilFromJson(Map<String, dynamic> json) => _$_Perfil(
      json['id'] as String,
      json['email'] as String,
      json['nome'] as String,
      json['telefone'] as int,
      DateTime.parse(json['entradaEm'] as String),
      json['fotoPerfil'] as String,
      $enumDecode(_$RegraPerfilEnumMap, json['regra']),
      json['cpf'] as String?,
      json['associacoes'] == null
          ? null
          : PerfilAssociacoes.fromJson(
              json['associacoes'] as Map<String, dynamic>),
      json['universitario'] == null
          ? null
          : InformacoesUniversitario.fromJson(
              json['universitario'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PerfilToJson(_$_Perfil instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nome': instance.nome,
      'telefone': instance.telefone,
      'entradaEm': instance.entradaEm.toIso8601String(),
      'fotoPerfil': instance.fotoPerfil,
      'regra': _$RegraPerfilEnumMap[instance.regra],
      'cpf': instance.cpf,
      'associacoes': instance.associacoes?.toJson(),
      'universitario': instance.universitario?.toJson(),
    };

const _$RegraPerfilEnumMap = {
  RegraPerfil.Administrador: 1,
  RegraPerfil.Projeto: 2,
  RegraPerfil.Geral: 3,
};

_$_PerfilAssociacoes _$$_PerfilAssociacoesFromJson(Map<String, dynamic> json) =>
    _$_PerfilAssociacoes(
      InformacoesCurso.fromJson(json['aluno'] as Map<String, dynamic>),
      InformacoesProfessor.fromJson(json['professor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PerfilAssociacoesToJson(
        _$_PerfilAssociacoes instance) =>
    <String, dynamic>{
      'aluno': instance.aluno.toJson(),
      'professor': instance.professor.toJson(),
    };

_$_InformacoesCurso _$$_InformacoesCursoFromJson(Map<String, dynamic> json) =>
    _$_InformacoesCurso(
      json['alunoParceiro'] as bool,
      (json['cursos'] as List<dynamic>?)
          ?.map((e) => Curso.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InformacoesCursoToJson(_$_InformacoesCurso instance) =>
    <String, dynamic>{
      'alunoParceiro': instance.alunoParceiro,
      'cursos': instance.cursos?.map((e) => e.toJson()).toList(),
    };

_$_InformacoesProfessor _$$_InformacoesProfessorFromJson(
        Map<String, dynamic> json) =>
    _$_InformacoesProfessor(
      json['professor'] as bool,
      (json['materiasProfessor'] as List<dynamic>?)
          ?.map((e) => Materia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InformacoesProfessorToJson(
        _$_InformacoesProfessor instance) =>
    <String, dynamic>{
      'professor': instance.professor,
      'materiasProfessor':
          instance.materiasProfessor?.map((e) => e.toJson()).toList(),
    };

_$_InformacoesUniversitario _$$_InformacoesUniversitarioFromJson(
        Map<String, dynamic> json) =>
    _$_InformacoesUniversitario(
      json['universitario'] as bool,
      json['email'] as String?,
      json['graduacao'] == null
          ? null
          : InformacoesUniversitarioGraduacao.fromJson(
              json['graduacao'] as Map<String, dynamic>),
      (json['atividadesQueColaborou'] as List<dynamic>?)
          ?.map((e) => ColaboracaoAtividade.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InformacoesUniversitarioToJson(
        _$_InformacoesUniversitario instance) =>
    <String, dynamic>{
      'universitario': instance.universitario,
      'email': instance.email,
      'graduacao': instance.graduacao?.toJson(),
      'atividadesQueColaborou':
          instance.atividadesQueColaborou?.map((e) => e.toJson()).toList(),
    };

_$_InformacoesUniversitarioGraduacao
    _$$_InformacoesUniversitarioGraduacaoFromJson(Map<String, dynamic> json) =>
        _$_InformacoesUniversitarioGraduacao(
          DateTime.parse(json['atualizadoEm'] as String),
          CursoUniversitario.fromJson(json['curso'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_InformacoesUniversitarioGraduacaoToJson(
        _$_InformacoesUniversitarioGraduacao instance) =>
    <String, dynamic>{
      'atualizadoEm': instance.atualizadoEm.toIso8601String(),
      'curso': instance.curso.toJson(),
    };

_$_ColaboracaoAtividade _$$_ColaboracaoAtividadeFromJson(
        Map<String, dynamic> json) =>
    _$_ColaboracaoAtividade(
      json['idResposta'] as String,
      json['idAtividade'] as String,
      (json['horas'] as num).toDouble(),
      json['aprovado'] as bool,
      json['horasEmitidas'] as bool?,
    );

Map<String, dynamic> _$$_ColaboracaoAtividadeToJson(
        _$_ColaboracaoAtividade instance) =>
    <String, dynamic>{
      'idResposta': instance.idResposta,
      'idAtividade': instance.idAtividade,
      'horas': instance.horas,
      'aprovado': instance.aprovado,
      'horasEmitidas': instance.horasEmitidas,
    };
