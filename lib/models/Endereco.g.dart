// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Endereco.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Endereco _$$_EnderecoFromJson(Map<String, dynamic> json) => _$_Endereco(
      json['rua'] as String,
      json['numero'] as int,
      json['complemento'] as String?,
      json['bairro'] as String,
      json['cidade'] as String,
      json['estado'] as String,
      json['cep'] as int,
      Localizacao.fromJson(json['localizacao'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EnderecoToJson(_$_Endereco instance) =>
    <String, dynamic>{
      'rua': instance.rua,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'cidade': instance.cidade,
      'estado': instance.estado,
      'cep': instance.cep,
      'localizacao': instance.localizacao,
    };
