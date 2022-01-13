// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BancoDeQuestoes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BancoDeQuestoes _$$_BancoDeQuestoesFromJson(Map<String, dynamic> json) =>
    _$_BancoDeQuestoes(
      json['id'] as String,
      const DateTimeConverter().fromJson(json['criadoEm'] as String),
      json['idProjeto'] as String,
      json['idCurso'] as String,
      json['idMateria'] as String?,
      QuestaoBancoDeQuestoes.fromJson(json['questao'] as Map<String, dynamic>),
      (json['assuntos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_BancoDeQuestoesToJson(_$_BancoDeQuestoes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'criadoEm': const DateTimeConverter().toJson(instance.criadoEm),
      'idProjeto': instance.idProjeto,
      'idCurso': instance.idCurso,
      'idMateria': instance.idMateria,
      'questao': instance.questao.toJson(),
      'assuntos': instance.assuntos,
    };
