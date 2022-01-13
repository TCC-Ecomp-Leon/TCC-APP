import subprocess
import os

os.chdir('./lib/models')

def add_date_converter(processed_input):
    processed_output = processed_input
    need_import = False
    search_date = processed_input.split("DateTime ")
    if(len(search_date)>1):
        need_import = True
        processed_output = "@DateTimeConverter() DateTime ".join(search_date)
    search_nullable_date = processed_output.split("DateTime? ")
    if(len(search_nullable_date)>1):
        need_import = True
        processed_output = "@NullableDateTimeConverter() DateTime? ".join(search_nullable_date)
    if(need_import):
        processed_output = "import 'package:tcc_app/models/core/date_time_converter.dart';\n" + processed_output
    return processed_output


def criador_class_freezed(class_name, fields):
    ret = '\n@freezed\n'
    ret = ret + 'abstract class '+class_name+' with _$'+class_name+' {\n'
    ret = ret + '  @JsonSerializable(explicitToJson: true)\n'
    ret = ret + '  const factory '+class_name+'(\n    '
    ret = ret + ',\n    '.join(fields)
    ret = ret + ',\n  ) = _'+class_name+';\n'
    ret = ret + '\n  factory '+class_name+'.fromJson(\n'
    ret = ret + '    Map<String, dynamic> json,\n'
    ret = ret + '  ) => \n'
    ret = ret + '      _$'+class_name+'FromJson(\n'
    ret = ret + '        json\n'
    ret = ret + '      );\n'
    ret = ret + '}'
    return ret


def arquivo_freezed(nome_arquivo, classes, imports, enums):
    conteudo = ''
    if(imports!=None):
        for _import in imports:
            conteudo = conteudo + "import '"+_import+".dart';\n"
    conteudo = conteudo + "import 'package:freezed_annotation/freezed_annotation.dart';"
    conteudo = conteudo + '\n\n' + "part '"+nome_arquivo+".freezed.dart';\n"
    conteudo = conteudo + "part '"+nome_arquivo+".g.dart';\n"
    for _class in classes:
        conteudo = conteudo + criador_class_freezed(_class[0], _class[1]) + '\n'
    if(enums!=None):
        for enum in enums:
            texto_conversor = 'int getNumero'+enum[0]+'('+enum[0]+' _enum){\n'
            texto_conversor = texto_conversor + '  switch (_enum) {\n'
            conteudo = conteudo + '\n'
            conteudo = conteudo + 'enum '+enum[0]+' {\n'
            for value in enum[1]:
                conteudo = conteudo + '  @JsonValue('+str(value[0])+')\n'
                conteudo = conteudo + '  '+value[1]+',\n'
                texto_conversor = texto_conversor + '    case '+enum[0]+'.'+value[1]+':\n'
                texto_conversor = texto_conversor + '      return '+str(value[0])+';\n'
            conteudo = conteudo + '}\n'
            texto_conversor = texto_conversor + '    default:\n'
            texto_conversor = texto_conversor + '      return '+str(enum[1][0][0])+';\n'
            texto_conversor = texto_conversor + '  }\n'
            texto_conversor = texto_conversor + '}\n'
        conteudo = conteudo + '\n' + texto_conversor + '\n'
    with open(nome_arquivo+'.dart', 'w') as f:
        f.write(add_date_converter(conteudo))


parametros_localizacao = [
    'Localizacao', [
        [
            'Localizacao', 
            [
                'double lat',
                'double lng',
            ], 
        ],
    ],
    None,
    None,
]
parametros_atividades = [
    'Atividade', [
        [
            'QuestaoAlternativa', 
            [
                'String idQuestao', 
                'String enunciado',
                'int peso',
                'List<QuestaoAlternativaAlternativa> alternativas',
            ], 
        ],
        [
            'QuestaoAlternativaAlternativa', 
            [
                'String item', 
                'bool value',
            ], 
        ],
        [
            'QuestaoDissertativa', 
            [
                'String idQuestao', 
                'String enunciado',
                'int peso',
                'QuestaoDissertativaRespostaEsperada respostaEsperada',
            ], 
        ],
        [
            'QuestaoDissertativaRespostaEsperada',
            [
                'bool foto',
                'String? texto',
                'String? imagem',
            ]
        ],
        [
            'Atividade',
            [
                'String id', 
                'String nome',
                'DateTime criadoEm',
                'String idProjeto',
                'String idCurso',
                'String? idMateria',
                'TipoAtividade tipoAtividade',
                'DateTime aberturaRespostas',
                'DateTime fechamentoRespostas',
                'List<String>? assuntos',
                'double? tempoColaboracao',
                'double? notaReferencia',
                'List<AtividadeItens>? itens',
                'DateTime? fechamentoCorrecoes',
            ]
        ],
        [
            'AtividadeItens',
            [
                'String idQuestao',
                'String enunciado',
                'double peso',
                'List<QuestaoAlternativaAlternativa>? alternativas',
                'QuestaoDissertativaRespostaEsperada? respostaEsperada',
            ]
        ],
    ],
    None,
    [
        [
            'TipoAtividade',
            [
                [1, 'Alternativa'],
                [2, 'Dissertativa'],
                [3, 'BancoDeQuestoes'],
            ]
        ]
    ],
]
parametros_banco_questoes = [
    'BancoDeQuestoes', [
        [
            'BancoDeQuestoes', 
            [
                'String id', 
                'DateTime criadoEm', 
                'String idProjeto', 
                'String idCurso', 
                'String? idMateria', 
                'QuestaoBancoDeQuestoes questao', 
                'List<String> assuntos'
            ], 
        ],
    ],
    ['./RespostaAtividade'],
    None,
]
parametros_codigo_de_entrada = [
    'CodigoEntrada', [
        [
            'CodigoEntrada', 
            [
                'String id', 
                'String idProjeto', 
                'DateTime geradoEm', 
                'bool usado',
                'DateTime? usadoEm',
                'String? idPerfilUsou',
                'TipoCodigoDeEntrada tipo',
                'String idCurso',
                'String? idMateria',
            ], 
        ],
    ],
    None,
    [
        [
            'TipoCodigoDeEntrada',
            [
                [0, 'Professor'],
                [1, 'Aluno'],
            ]
        ]
    ],
]
parametros_curso = [
    'Curso', [
        [
            'Curso', 
            [
                'String id', 
                'String idProjeto', 
                'String nome',
                'String descricao',
                'DateTime inicioCurso',
                'DateTime fimCurso',
                'DateTime atualizadoEm',
                'List<String> turma',
                'List<Materia> materias',
            ], 
        ],
    ],
    ['./Materia'],
    None,
]
parametros_curso_universitario = [
    'CursoUniversitario', [
        [
            'CursoUniversitario', 
            [
                'String id', 
                'String nome',
                'String descricao',
                'int semestresPrevistos',
                'CursoUniversitario? cursoAnterior',
            ], 
        ],
    ],
    None,
    None,
]
parametros_duvida = [
    'Duvida', [
        [
            'Duvida', 
            [
                'String id', 
                'String titulo',
                'String descricao',
                'String idAluno',
                'String idCursoAluno',
                'String? idMateria',
                'String? idCursoUniversitario',
                'bool resolvida',
                'List<DuvidaMensagem> mensagens',
            ], 
        ],
        [
            'DuvidaMensagem', 
            [
                'String idPerfil',
                'DateTime horario',
                'String mensagem',
            ], 
        ],
    ],
    None,
    None,
]
parametros_endereco = [
    'Endereco', [
        [
            'Endereco', 
            [
                'String rua',
                'int numero',
                'String? complemento',
                'String bairro',
                'String cidade',
                'String estado',
                'int cep',
                'Localizacao localizacao',
            ], 
        ],
    ],
    ['./Localizacao'],
    None,
]
parametros_materia = [
    'Materia', [
        [
            'Materia', 
            [
                'String id',
                'String? idPerfilProfessor',
                'String nome',
                'String descricao',
                'String idCurso',
            ], 
        ],
    ],
    None,
    None,
]
parametros_perfil = [
    'Perfil', [
        [
            'Perfil', 
            [
                'String id',
                'String email',
                'String nome',
                'int telefone',
                'DateTime entradaEm',
                'String fotoPerfil',
                'RegraPerfil regra',
                'String? cpf',
                'PerfilAssociacoes? associacoes',
                'InformacoesUniversitario? universitario',
            ], 
        ],
        [
            'PerfilAssociacoes', 
            [
                'InformacoesCurso aluno',
                'InformacoesProfessor professor',
            ], 
        ],
        [
            'InformacoesCurso',
            [
                'bool alunoParceiro',
                'List<Curso>? cursos',
            ]
        ],
        [
            'InformacoesProfessor',
            [
                'bool professor',
                'List<Materia>? materiasProfessor',
            ]
        ],
        [
            'InformacoesUniversitario',
            [
                'bool universitario',
                'String? email',
                'InformacoesUniversitarioGraduacao? graduacao',
                'List<ColaboracaoAtividade>? atividadesQueColaborou',
            ]
        ],
        [
            'InformacoesUniversitarioGraduacao',
            [
                'DateTime atualizadoEm',
                'CursoUniversitario curso',
            ]
        ],
        [
            'ColaboracaoAtividade',
            [
                'String idResposta',
                'String idAtividade',
                'double horas',
                'bool aprovado',
                'bool? horasEmitidas',
            ]
        ]
    ],
    ['./Curso', './Materia', './CursoUniversitario'],
    [
        [
            'RegraPerfil',
            [
                [1, 'Administrador'],
                [2, 'Projeto'],
                [3, 'Geral'],
            ]
        ]
    ],
]
parametros_projeto = [
    'Projeto', [
        [
            'Projeto', 
            [
                'String id',
                'String nome',
                'String descricao',
                'String email',
                'int telefone',
                'DateTime requisicaoEntradaEm',
                'String imgProjeto',
                'Endereco endereco',
                'bool aprovado',
                'String? idPerfilResponsavel',
                'DateTime? entradaEm',
                'List<Curso> cursos',
            ], 
        ],
    ],
    ['./Curso', './Endereco'],
    None,
]
parametros_resposta_atividade = [
    'RespostaAtividade', [
        [
            'RespostaAtividade', 
            [
                'String id',
                'String idAtividade',
                'DateTime respondidoEm',
                'String idProjeto',
                'String? idCurso',
                'String? idMateria',
                'TipoAtividade tipo',
                'List<RespostaAtividadeResposta> respostas',
                'String? idAluno',
                'String? idUniversitario',
                'bool? encerrada',
                'String? nota',
                'bool? corrigida',
                'DateTime? horarioCorrecao',
                'String? idPerfilCorrecao',
                'CorrecaoDissertativa? correcaoQuestao',
                'EstadoRevisao? revisao',
                'DateTime? revisaoRequisitadaEm',
                'DateTime? revisaoAtendidaEm',
                'CorrecaoDissertativa? revisaoQuestoes',
                'double? notaRevisao',
                'double? notaAnteriorRevisao',
                'bool? avaliada',
                'DateTime? avaliadaEm',
                'String? avaliadaPor',
                'List<RespostaAtividadeAvaliacaoBanco>? avaliacaoQuestoes',
                'String? comentario',
            ], 
        ],
        [
            'RespostaAtividadeAvaliacaoBanco',
            [
                'String idQuestao',
                'bool aprovada',
            ]
        ],
        [
            'RespostaAtividadeResposta',
            [
                'String idQuestao',
                'List<RespostaAtividadeRespostaAlternativa>? alternativas',
                'RespostaAtividadeDissertativaResposta? resposta',
                'String? idAtividade',
                'String? enunciado',
            ]
        ],
        [
            'RespostaAtividadeRespostaAlternativa',
            [
                'String item',
                'bool value',
            ]
        ],
        [
            'RespostaAtividadeDissertativaResposta',
            [
                'bool foto',
                'String? texto',
                'String? imagem',
            ]
        ],
        [
            'QuestaoBancoDeQuestoes',
            [
                'String idAtividade',
                'String idQuestao',
                'String enunciado',
                'List<RespostaAtividadeRespostaAlternativa> alternativas',
            ]
        ],
        [
            'CorrecaoDissertativa',
            [
                'String idQuestao',
                'double nota',
                'StatusRespostaDissertativa status',
                'String comentarios',
                'String idProjeto',
                'String? idCurso',
                'String? idMateria',
            ]
        ]
    ],
    ['./Atividade',],
    [
        [
            'EstadoRevisao',
            [
                [1, 'Nenhum'],
                [2, 'Requisitada'],
                [3, 'Finalizada'],
            ]
        ],
        [
            'StatusRespostaDissertativa',
            [
                [1, 'Errado'],
                [2, 'Certo'],
                [3, 'ParcialmenteCerto'],
            ]
        ]
    ],
]
parametros = [
    parametros_localizacao,
    parametros_atividades,
    parametros_banco_questoes,
    parametros_codigo_de_entrada,
    parametros_curso,
    parametros_curso_universitario,
    parametros_duvida,
    parametros_endereco,
    parametros_materia,
    parametros_perfil,
    parametros_projeto,
    parametros_resposta_atividade,
]

nomes_arquivos = []
for parametro in parametros:
    nomes_arquivos.append(parametro[0])
    arquivo_freezed(
        parametro[0],
        parametro[1],
        parametro[2],
        parametro[3]
    )

index_str = ''
for name in nomes_arquivos:
    index_str = index_str + "import './"+name+".dart';\n"

with open('index.dart', 'w') as f:
    f.write(index_str)

os.chdir('../../')
print('going to run dart build runner')
subprocess.Popen("dart run build_runner build --delete-conflicting-outputs", shell=True).wait()

