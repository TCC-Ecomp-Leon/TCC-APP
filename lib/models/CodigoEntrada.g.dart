// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CodigoEntrada.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CodigoEntrada _$$_CodigoEntradaFromJson(Map<String, dynamic> json) =>
    _$_CodigoEntrada(
      json['id'] as String,
      json['idProjeto'] as String,
      const DateTimeConverter().fromJson(json['geradoEm'] as String),
      json['usado'] as bool,
      const NullableDateTimeConverter().fromJson(json['usadoEm'] as String?),
      json['idPerfilUsou'] as String?,
      $enumDecode(_$TipoCodigoDeEntradaEnumMap, json['tipo']),
      json['idCurso'] as String,
      json['idMateria'] as String?,
    );

Map<String, dynamic> _$$_CodigoEntradaToJson(_$_CodigoEntrada instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idProjeto': instance.idProjeto,
      'geradoEm': const DateTimeConverter().toJson(instance.geradoEm),
      'usado': instance.usado,
      'usadoEm': const NullableDateTimeConverter().toJson(instance.usadoEm),
      'idPerfilUsou': instance.idPerfilUsou,
      'tipo': _$TipoCodigoDeEntradaEnumMap[instance.tipo],
      'idCurso': instance.idCurso,
      'idMateria': instance.idMateria,
    };

const _$TipoCodigoDeEntradaEnumMap = {
  TipoCodigoDeEntrada.Professor: 0,
  TipoCodigoDeEntrada.Aluno: 1,
};
