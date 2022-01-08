// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CodigoEntrada.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CodigoEntrada _$$_CodigoEntradaFromJson(Map<String, dynamic> json) =>
    _$_CodigoEntrada(
      json['id'] as String,
      json['idProjeto'] as String,
      DateTime.parse(json['geradoEm'] as String),
      json['usado'] as bool,
      json['usadoEm'] == null
          ? null
          : DateTime.parse(json['usadoEm'] as String),
      json['idPerfilUsou'] as String?,
      $enumDecode(_$TipoCodigoDeEntradaEnumMap, json['tipo']),
      json['idCurso'] as String,
      json['idMateria'] as String?,
    );

Map<String, dynamic> _$$_CodigoEntradaToJson(_$_CodigoEntrada instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idProjeto': instance.idProjeto,
      'geradoEm': instance.geradoEm.toIso8601String(),
      'usado': instance.usado,
      'usadoEm': instance.usadoEm?.toIso8601String(),
      'idPerfilUsou': instance.idPerfilUsou,
      'tipo': _$TipoCodigoDeEntradaEnumMap[instance.tipo],
      'idCurso': instance.idCurso,
      'idMateria': instance.idMateria,
    };

const _$TipoCodigoDeEntradaEnumMap = {
  TipoCodigoDeEntrada.Professor: 0,
  TipoCodigoDeEntrada.Aluno: 1,
};
