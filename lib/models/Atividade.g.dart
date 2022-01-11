// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Atividade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestaoAlternativa _$$_QuestaoAlternativaFromJson(
        Map<String, dynamic> json) =>
    _$_QuestaoAlternativa(
      json['idQuestao'] as String,
      json['enunciado'] as String,
      json['peso'] as int,
      (json['alternativas'] as List<dynamic>)
          .map((e) =>
              QuestaoAlternativaAlternativa.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestaoAlternativaToJson(
        _$_QuestaoAlternativa instance) =>
    <String, dynamic>{
      'idQuestao': instance.idQuestao,
      'enunciado': instance.enunciado,
      'peso': instance.peso,
      'alternativas': instance.alternativas.map((e) => e.toJson()).toList(),
    };

_$_QuestaoAlternativaAlternativa _$$_QuestaoAlternativaAlternativaFromJson(
        Map<String, dynamic> json) =>
    _$_QuestaoAlternativaAlternativa(
      json['item'] as String,
      json['value'] as bool,
    );

Map<String, dynamic> _$$_QuestaoAlternativaAlternativaToJson(
        _$_QuestaoAlternativaAlternativa instance) =>
    <String, dynamic>{
      'item': instance.item,
      'value': instance.value,
    };

_$_QuestaoDissertativa _$$_QuestaoDissertativaFromJson(
        Map<String, dynamic> json) =>
    _$_QuestaoDissertativa(
      json['idQuestao'] as String,
      json['enunciado'] as String,
      json['peso'] as int,
      QuestaoDissertativaRespostaEsperada.fromJson(
          json['respostaEsperada'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuestaoDissertativaToJson(
        _$_QuestaoDissertativa instance) =>
    <String, dynamic>{
      'idQuestao': instance.idQuestao,
      'enunciado': instance.enunciado,
      'peso': instance.peso,
      'respostaEsperada': instance.respostaEsperada.toJson(),
    };

_$_QuestaoDissertativaRespostaEsperada
    _$$_QuestaoDissertativaRespostaEsperadaFromJson(
            Map<String, dynamic> json) =>
        _$_QuestaoDissertativaRespostaEsperada(
          json['foto'] as bool,
          json['texto'] as String?,
          json['imagem'] as String?,
        );

Map<String, dynamic> _$$_QuestaoDissertativaRespostaEsperadaToJson(
        _$_QuestaoDissertativaRespostaEsperada instance) =>
    <String, dynamic>{
      'foto': instance.foto,
      'texto': instance.texto,
      'imagem': instance.imagem,
    };

_$_Atividade _$$_AtividadeFromJson(Map<String, dynamic> json) => _$_Atividade(
      json['id'] as String,
      json['nome'] as String,
      DateTime.parse(json['criadoEm'] as String),
      json['idProjeto'] as String,
      json['idCurso'] as String,
      json['idMateria'] as String?,
      $enumDecode(_$TipoAtividadeEnumMap, json['tipoAtividade']),
      DateTime.parse(json['aberturaRespostas'] as String),
      DateTime.parse(json['fechamentoRespostas'] as String),
      (json['assuntos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['tempoColaboracao'] as num?)?.toDouble(),
      (json['notaReferencia'] as num?)?.toDouble(),
      (json['itens'] as List<dynamic>?)
          ?.map((e) => AtividadeItens.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['fechamentoCorrecoes'] == null
          ? null
          : DateTime.parse(json['fechamentoCorrecoes'] as String),
    );

Map<String, dynamic> _$$_AtividadeToJson(_$_Atividade instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'criadoEm': instance.criadoEm.toIso8601String(),
      'idProjeto': instance.idProjeto,
      'idCurso': instance.idCurso,
      'idMateria': instance.idMateria,
      'tipoAtividade': _$TipoAtividadeEnumMap[instance.tipoAtividade],
      'aberturaRespostas': instance.aberturaRespostas.toIso8601String(),
      'fechamentoRespostas': instance.fechamentoRespostas.toIso8601String(),
      'assuntos': instance.assuntos,
      'tempoColaboracao': instance.tempoColaboracao,
      'notaReferencia': instance.notaReferencia,
      'itens': instance.itens?.map((e) => e.toJson()).toList(),
      'fechamentoCorrecoes': instance.fechamentoCorrecoes?.toIso8601String(),
    };

const _$TipoAtividadeEnumMap = {
  TipoAtividade.Alternativa: 1,
  TipoAtividade.Dissertativa: 2,
  TipoAtividade.BancoDeQuestoes: 3,
};

_$_AtividadeItens _$$_AtividadeItensFromJson(Map<String, dynamic> json) =>
    _$_AtividadeItens(
      json['idQuestao'] as String,
      json['enunciado'] as String,
      (json['peso'] as num).toDouble(),
      (json['alternativas'] as List<dynamic>?)
          ?.map((e) =>
              QuestaoAlternativaAlternativa.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['respostaEsperada'] == null
          ? null
          : QuestaoDissertativaRespostaEsperada.fromJson(
              json['respostaEsperada'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AtividadeItensToJson(_$_AtividadeItens instance) =>
    <String, dynamic>{
      'idQuestao': instance.idQuestao,
      'enunciado': instance.enunciado,
      'peso': instance.peso,
      'alternativas': instance.alternativas?.map((e) => e.toJson()).toList(),
      'respostaEsperada': instance.respostaEsperada?.toJson(),
    };
