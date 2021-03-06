// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Projeto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Projeto _$$_ProjetoFromJson(Map<String, dynamic> json) => _$_Projeto(
      json['id'] as String,
      json['nome'] as String,
      json['descricao'] as String,
      json['email'] as String,
      json['telefone'] as int,
      const DateTimeConverter().fromJson(json['requisicaoEntradaEm'] as String),
      json['imgProjeto'] as String,
      Endereco.fromJson(json['endereco'] as Map<String, dynamic>),
      json['aprovado'] as bool,
      json['idPerfilResponsavel'] as String?,
      const NullableDateTimeConverter().fromJson(json['entradaEm'] as String?),
      (json['cursos'] as List<dynamic>?)
          ?.map((e) => Curso.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjetoToJson(_$_Projeto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'email': instance.email,
      'telefone': instance.telefone,
      'requisicaoEntradaEm':
          const DateTimeConverter().toJson(instance.requisicaoEntradaEm),
      'imgProjeto': instance.imgProjeto,
      'endereco': instance.endereco.toJson(),
      'aprovado': instance.aprovado,
      'idPerfilResponsavel': instance.idPerfilResponsavel,
      'entradaEm': const NullableDateTimeConverter().toJson(instance.entradaEm),
      'cursos': instance.cursos?.map((e) => e.toJson()).toList(),
    };
