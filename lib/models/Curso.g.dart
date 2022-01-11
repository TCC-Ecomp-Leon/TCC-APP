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
      DateTime.parse(json['inicioCurso'] as String),
      DateTime.parse(json['fimCurso'] as String),
      DateTime.parse(json['atualizadoEm'] as String),
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
      'inicioCurso': instance.inicioCurso.toIso8601String(),
      'fimCurso': instance.fimCurso.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm.toIso8601String(),
      'turma': instance.turma,
      'materias': instance.materias.map((e) => e.toJson()).toList(),
    };
