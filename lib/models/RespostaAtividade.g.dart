// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RespostaAtividade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RespostaAtividade _$$_RespostaAtividadeFromJson(Map<String, dynamic> json) =>
    _$_RespostaAtividade(
      json['id'] as String,
      json['idAtividade'] as String,
      DateTime.parse(json['respondidoEm'] as String),
      json['idProjeto'] as String,
      json['idCurso'] as String?,
      json['idMateria'] as String?,
      $enumDecode(_$TipoAtividadeEnumMap, json['tipo']),
      (json['respostas'] as List<dynamic>)
          .map((e) =>
              RespostaAtividadeResposta.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['idAluno'] as String?,
      json['idUniversitario'] as String?,
      json['encerrada'] as bool?,
      json['nota'] as String?,
      json['corrigida'] as bool?,
      json['horarioCorrecao'] == null
          ? null
          : DateTime.parse(json['horarioCorrecao'] as String),
      json['idPerfilCorrecao'] as String?,
      json['correcaoQuestao'] == null
          ? null
          : CorrecaoDissertativa.fromJson(
              json['correcaoQuestao'] as Map<String, dynamic>),
      $enumDecodeNullable(_$EstadoRevisaoEnumMap, json['revisao']),
      json['revisaoRequisitadaEm'] == null
          ? null
          : DateTime.parse(json['revisaoRequisitadaEm'] as String),
      json['revisaoAtendidaEm'] == null
          ? null
          : DateTime.parse(json['revisaoAtendidaEm'] as String),
      json['revisaoQuestoes'] == null
          ? null
          : CorrecaoDissertativa.fromJson(
              json['revisaoQuestoes'] as Map<String, dynamic>),
      (json['notaRevisao'] as num?)?.toDouble(),
      (json['notaAnteriorRevisao'] as num?)?.toDouble(),
      json['avaliada'] as bool?,
      json['avaliadaEm'] == null
          ? null
          : DateTime.parse(json['avaliadaEm'] as String),
      json['avaliadaPor'] as String?,
      (json['avaliacaoQuestoes'] as List<dynamic>?)
          ?.map((e) => RespostaAtividadeAvaliacaoBanco.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['comentario'] as String?,
    );

Map<String, dynamic> _$$_RespostaAtividadeToJson(
        _$_RespostaAtividade instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idAtividade': instance.idAtividade,
      'respondidoEm': instance.respondidoEm.toIso8601String(),
      'idProjeto': instance.idProjeto,
      'idCurso': instance.idCurso,
      'idMateria': instance.idMateria,
      'tipo': _$TipoAtividadeEnumMap[instance.tipo],
      'respostas': instance.respostas,
      'idAluno': instance.idAluno,
      'idUniversitario': instance.idUniversitario,
      'encerrada': instance.encerrada,
      'nota': instance.nota,
      'corrigida': instance.corrigida,
      'horarioCorrecao': instance.horarioCorrecao?.toIso8601String(),
      'idPerfilCorrecao': instance.idPerfilCorrecao,
      'correcaoQuestao': instance.correcaoQuestao,
      'revisao': _$EstadoRevisaoEnumMap[instance.revisao],
      'revisaoRequisitadaEm': instance.revisaoRequisitadaEm?.toIso8601String(),
      'revisaoAtendidaEm': instance.revisaoAtendidaEm?.toIso8601String(),
      'revisaoQuestoes': instance.revisaoQuestoes,
      'notaRevisao': instance.notaRevisao,
      'notaAnteriorRevisao': instance.notaAnteriorRevisao,
      'avaliada': instance.avaliada,
      'avaliadaEm': instance.avaliadaEm?.toIso8601String(),
      'avaliadaPor': instance.avaliadaPor,
      'avaliacaoQuestoes': instance.avaliacaoQuestoes,
      'comentario': instance.comentario,
    };

const _$TipoAtividadeEnumMap = {
  TipoAtividade.Alternativa: 1,
  TipoAtividade.Dissertativa: 2,
  TipoAtividade.BancoDeQuestoes: 3,
};

const _$EstadoRevisaoEnumMap = {
  EstadoRevisao.Nenhum: 1,
  EstadoRevisao.Requisitada: 2,
  EstadoRevisao.Finalizada: 3,
};

_$_RespostaAtividadeAvaliacaoBanco _$$_RespostaAtividadeAvaliacaoBancoFromJson(
        Map<String, dynamic> json) =>
    _$_RespostaAtividadeAvaliacaoBanco(
      json['idQuestao'] as String,
      json['aprovada'] as bool,
    );

Map<String, dynamic> _$$_RespostaAtividadeAvaliacaoBancoToJson(
        _$_RespostaAtividadeAvaliacaoBanco instance) =>
    <String, dynamic>{
      'idQuestao': instance.idQuestao,
      'aprovada': instance.aprovada,
    };

_$_RespostaAtividadeResposta _$$_RespostaAtividadeRespostaFromJson(
        Map<String, dynamic> json) =>
    _$_RespostaAtividadeResposta(
      json['idQuestao'] as String,
      (json['alternativas'] as List<dynamic>?)
          ?.map((e) => RespostaAtividadeRespostaAlternativa.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['resposta'] == null
          ? null
          : RespostaAtividadeDissertativaResposta.fromJson(
              json['resposta'] as Map<String, dynamic>),
      json['idAtividade'] as String?,
      json['enunciado'] as String?,
    );

Map<String, dynamic> _$$_RespostaAtividadeRespostaToJson(
        _$_RespostaAtividadeResposta instance) =>
    <String, dynamic>{
      'idQuestao': instance.idQuestao,
      'alternativas': instance.alternativas,
      'resposta': instance.resposta,
      'idAtividade': instance.idAtividade,
      'enunciado': instance.enunciado,
    };

_$_RespostaAtividadeRespostaAlternativa
    _$$_RespostaAtividadeRespostaAlternativaFromJson(
            Map<String, dynamic> json) =>
        _$_RespostaAtividadeRespostaAlternativa(
          json['item'] as String,
          json['value'] as bool,
        );

Map<String, dynamic> _$$_RespostaAtividadeRespostaAlternativaToJson(
        _$_RespostaAtividadeRespostaAlternativa instance) =>
    <String, dynamic>{
      'item': instance.item,
      'value': instance.value,
    };

_$_RespostaAtividadeDissertativaResposta
    _$$_RespostaAtividadeDissertativaRespostaFromJson(
            Map<String, dynamic> json) =>
        _$_RespostaAtividadeDissertativaResposta(
          json['foto'] as bool,
          json['texto'] as String?,
          json['imagem'] as String?,
        );

Map<String, dynamic> _$$_RespostaAtividadeDissertativaRespostaToJson(
        _$_RespostaAtividadeDissertativaResposta instance) =>
    <String, dynamic>{
      'foto': instance.foto,
      'texto': instance.texto,
      'imagem': instance.imagem,
    };

_$_QuestaoBancoDeQuestoes _$$_QuestaoBancoDeQuestoesFromJson(
        Map<String, dynamic> json) =>
    _$_QuestaoBancoDeQuestoes(
      json['idAtividade'] as String,
      json['idQuestao'] as String,
      json['enunciado'] as String,
      (json['alternativas'] as List<dynamic>)
          .map((e) => RespostaAtividadeRespostaAlternativa.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestaoBancoDeQuestoesToJson(
        _$_QuestaoBancoDeQuestoes instance) =>
    <String, dynamic>{
      'idAtividade': instance.idAtividade,
      'idQuestao': instance.idQuestao,
      'enunciado': instance.enunciado,
      'alternativas': instance.alternativas,
    };

_$_CorrecaoDissertativa _$$_CorrecaoDissertativaFromJson(
        Map<String, dynamic> json) =>
    _$_CorrecaoDissertativa(
      json['idQuestao'] as String,
      (json['nota'] as num).toDouble(),
      $enumDecode(_$StatusRespostaDissertativaEnumMap, json['status']),
      json['comentarios'] as String,
      json['idProjeto'] as String,
      json['idCurso'] as String?,
      json['idMateria'] as String?,
    );

Map<String, dynamic> _$$_CorrecaoDissertativaToJson(
        _$_CorrecaoDissertativa instance) =>
    <String, dynamic>{
      'idQuestao': instance.idQuestao,
      'nota': instance.nota,
      'status': _$StatusRespostaDissertativaEnumMap[instance.status],
      'comentarios': instance.comentarios,
      'idProjeto': instance.idProjeto,
      'idCurso': instance.idCurso,
      'idMateria': instance.idMateria,
    };

const _$StatusRespostaDissertativaEnumMap = {
  StatusRespostaDissertativa.Errado: 1,
  StatusRespostaDissertativa.Certo: 2,
  StatusRespostaDissertativa.ParcialmenteCerto: 3,
};
