// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Curso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Curso _$$_CursoFromJson(Map<String, dynamic> json) => _$_Curso(
      json['id'] as String,
      json['idProjeto'] as String,
      json['nome'] as String,
      json['descricao'] as String,
      const DateTimeConverter().fromJson(json['inicioCurso'] as String),
      const DateTimeConverter().fromJson(json['fimCurso'] as String),
      const DateTimeConverter().fromJson(json['atualizadoEm'] as String),
      (json['turma'] as List<dynamic>).map((e) => e as String).toList(),
      (json['materias'] as List<dynamic>)
          .map((e) => Materia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CursoToJson(_$_Curso instance) => <String, dynamic>{
      'id': instance.id,
      'idProjeto': instance.idProjeto,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'inicioCurso': const DateTimeConverter().toJson(instance.inicioCurso),
      'fimCurso': const DateTimeConverter().toJson(instance.fimCurso),
      'atualizadoEm': const DateTimeConverter().toJson(instance.atualizadoEm),
      'turma': instance.turma,
      'materias': instance.materias.map((e) => e.toJson()).toList(),
    };
