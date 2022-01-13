// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Duvida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Duvida _$$_DuvidaFromJson(Map<String, dynamic> json) => _$_Duvida(
      json['id'] as String,
      json['titulo'] as String,
      json['descricao'] as String,
      json['idAluno'] as String,
      json['idCursoAluno'] as String,
      json['idMateria'] as String?,
      json['idCursoUniversitario'] as String?,
      json['resolvida'] as bool,
      (json['mensagens'] as List<dynamic>)
          .map((e) => DuvidaMensagem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DuvidaToJson(_$_Duvida instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'idAluno': instance.idAluno,
      'idCursoAluno': instance.idCursoAluno,
      'idMateria': instance.idMateria,
      'idCursoUniversitario': instance.idCursoUniversitario,
      'resolvida': instance.resolvida,
      'mensagens': instance.mensagens.map((e) => e.toJson()).toList(),
    };

_$_DuvidaMensagem _$$_DuvidaMensagemFromJson(Map<String, dynamic> json) =>
    _$_DuvidaMensagem(
      json['idPerfil'] as String,
      const DateTimeConverter().fromJson(json['horario'] as String),
      json['mensagem'] as String,
    );

Map<String, dynamic> _$$_DuvidaMensagemToJson(_$_DuvidaMensagem instance) =>
    <String, dynamic>{
      'idPerfil': instance.idPerfil,
      'horario': const DateTimeConverter().toJson(instance.horario),
      'mensagem': instance.mensagem,
    };
