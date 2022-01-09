import './Atividade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'RespostaAtividade.freezed.dart';
part 'RespostaAtividade.g.dart';

@freezed
abstract class RespostaAtividade with _$RespostaAtividade {
  const factory RespostaAtividade(
    String id,
    String idAtividade,
    DateTime respondidoEm,
    String idProjeto,
    String? idCurso,
    String? idMateria,
    TipoAtividade tipo,
    List<RespostaAtividadeResposta> respostas,
    String? idAluno,
    String? idUniversitario,
    bool? encerrada,
    String? nota,
    bool? corrigida,
    DateTime? horarioCorrecao,
    String? idPerfilCorrecao,
    CorrecaoDissertativa? correcaoQuestao,
    EstadoRevisao? revisao,
    DateTime? revisaoRequisitadaEm,
    DateTime? revisaoAtendidaEm,
    CorrecaoDissertativa? revisaoQuestoes,
    double? notaRevisao,
    double? notaAnteriorRevisao,
    bool? avaliada,
    DateTime? avaliadaEm,
    String? avaliadaPor,
    List<RespostaAtividadeAvaliacaoBanco>? avaliacaoQuestoes,
    String? comentario,
  ) = _RespostaAtividade;

  factory RespostaAtividade.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$RespostaAtividadeFromJson(
        json
      );
}

@freezed
abstract class RespostaAtividadeAvaliacaoBanco with _$RespostaAtividadeAvaliacaoBanco {
  const factory RespostaAtividadeAvaliacaoBanco(
    String idQuestao,
    bool aprovada,
  ) = _RespostaAtividadeAvaliacaoBanco;

  factory RespostaAtividadeAvaliacaoBanco.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$RespostaAtividadeAvaliacaoBancoFromJson(
        json
      );
}

@freezed
abstract class RespostaAtividadeResposta with _$RespostaAtividadeResposta {
  const factory RespostaAtividadeResposta(
    String idQuestao,
    List<RespostaAtividadeRespostaAlternativa>? alternativas,
    RespostaAtividadeDissertativaResposta? resposta,
    String? idAtividade,
    String? enunciado,
  ) = _RespostaAtividadeResposta;

  factory RespostaAtividadeResposta.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$RespostaAtividadeRespostaFromJson(
        json
      );
}

@freezed
abstract class RespostaAtividadeRespostaAlternativa with _$RespostaAtividadeRespostaAlternativa {
  const factory RespostaAtividadeRespostaAlternativa(
    String item,
    bool value,
  ) = _RespostaAtividadeRespostaAlternativa;

  factory RespostaAtividadeRespostaAlternativa.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$RespostaAtividadeRespostaAlternativaFromJson(
        json
      );
}

@freezed
abstract class RespostaAtividadeDissertativaResposta with _$RespostaAtividadeDissertativaResposta {
  const factory RespostaAtividadeDissertativaResposta(
    bool foto,
    String? texto,
    String? imagem,
  ) = _RespostaAtividadeDissertativaResposta;

  factory RespostaAtividadeDissertativaResposta.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$RespostaAtividadeDissertativaRespostaFromJson(
        json
      );
}

@freezed
abstract class QuestaoBancoDeQuestoes with _$QuestaoBancoDeQuestoes {
  const factory QuestaoBancoDeQuestoes(
    String idAtividade,
    String idQuestao,
    String enunciado,
    List<RespostaAtividadeRespostaAlternativa> alternativas,
  ) = _QuestaoBancoDeQuestoes;

  factory QuestaoBancoDeQuestoes.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$QuestaoBancoDeQuestoesFromJson(
        json
      );
}

@freezed
abstract class CorrecaoDissertativa with _$CorrecaoDissertativa {
  const factory CorrecaoDissertativa(
    String idQuestao,
    double nota,
    StatusRespostaDissertativa status,
    String comentarios,
    String idProjeto,
    String? idCurso,
    String? idMateria,
  ) = _CorrecaoDissertativa;

  factory CorrecaoDissertativa.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$CorrecaoDissertativaFromJson(
        json
      );
}

enum EstadoRevisao {
  @JsonValue(1)
  Nenhum,
  @JsonValue(2)
  Requisitada,
  @JsonValue(3)
  Finalizada,
}

enum StatusRespostaDissertativa {
  @JsonValue(1)
  Errado,
  @JsonValue(2)
  Certo,
  @JsonValue(3)
  ParcialmenteCerto,
}

int getNumeroStatusRespostaDissertativa(StatusRespostaDissertativa _enum){
  switch (_enum) {
    case StatusRespostaDissertativa.Errado:
      return 1;
    case StatusRespostaDissertativa.Certo:
      return 2;
    case StatusRespostaDissertativa.ParcialmenteCerto:
      return 3;
    default:
      return 1;
  }
}

