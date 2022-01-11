// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CursoUniversitario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CursoUniversitario _$$_CursoUniversitarioFromJson(
        Map<String, dynamic> json) =>
    _$_CursoUniversitario(
      json['id'] as String,
      json['nome'] as String,
      json['descricao'] as String,
      json['semestresPrevistos'] as int,
      json['cursoAnterior'] == null
          ? null
          : CursoUniversitario.fromJson(
              json['cursoAnterior'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CursoUniversitarioToJson(
        _$_CursoUniversitario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'semestresPrevistos': instance.semestresPrevistos,
      'cursoAnterior': instance.cursoAnterior?.toJson(),
    };
