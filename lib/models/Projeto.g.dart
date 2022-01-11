// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Projeto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Projeto _$$_ProjetoFromJson(Map<String, dynamic> json) => _$_Projeto(
      json['id'] as String,
      json['nome'] as String,
      json['descricao'] as String,
      json['telefone'] as int,
      DateTime.parse(json['requisicaoEntradaEm'] as String),
      json['imgProjeto'] as String,
      Endereco.fromJson(json['endereco'] as Map<String, dynamic>),
      json['aprovado'] as bool,
      json['idPerfilResponsavel'] as String?,
      json['entradaEm'] == null
          ? null
          : DateTime.parse(json['entradaEm'] as String),
      (json['cursos'] as List<dynamic>)
          .map((e) => Curso.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjetoToJson(_$_Projeto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'telefone': instance.telefone,
      'requisicaoEntradaEm': instance.requisicaoEntradaEm.toIso8601String(),
      'imgProjeto': instance.imgProjeto,
      'endereco': instance.endereco.toJson(),
      'aprovado': instance.aprovado,
      'idPerfilResponsavel': instance.idPerfilResponsavel,
      'entradaEm': instance.entradaEm?.toIso8601String(),
      'cursos': instance.cursos.map((e) => e.toJson()).toList(),
    };
