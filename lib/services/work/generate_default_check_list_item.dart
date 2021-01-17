import 'package:constructionChecker/models/check_list.dart';

List<ICheckList> generateDefaultCheckLists(int workId) {
  var _check1 = ICheckList(
    description: 'LIMPEZA DO TERRENO',
    payAtention: '',
    step: 'SERVIÇOS INICIAIS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check2 = ICheckList(
    description: 'GABARITO',
    payAtention: 'CONFERIR DESNIVEL ADOTADO',
    step: 'SERVIÇOS INICIAIS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check3 = ICheckList(
    description: 'ESQUADRO DO TERRENO',
    payAtention: 'VERIFICAR ONDE SAIU, ANALISAR EDIF. EM RELAÇÃO AO TERRENO',
    step: 'SERVIÇOS INICIAIS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check4 = ICheckList(
    description: 'LOCAÇÃO DAS SAPATAS',
    payAtention: 'CONFERIR TODAS AS LOCAÇÕES FEITAS NA LINHA',
    step: 'SERVIÇOS INICIAIS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check5 = ICheckList(
    description: 'ESCAVAÇÃO DAS SAPATAS',
    payAtention: 'CONTABILIZAR TODAS AS SAPATAS, CONFERIR TODAS AS DIMENSÕES',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check6 = ICheckList(
    description: 'ARMAÇÃO DE SAPATAS E ARRANQUES',
    payAtention: 'CONFERIR DISTRIBUIÇÃO E ESPAÇAMENTO',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check7 = ICheckList(
    description: 'CONCRETAGEM DAS SAPATAS',
    payAtention: 'CONFERIR FCK CONCRETO E DISTANCIA DE LANÇAMENTO',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check8 = ICheckList(
    description: 'FORMA DE ARRANQUES',
    payAtention:
        'CONFERIR PRUMADA DE ARRANQUES E COBRIMENTO, ALEM DE POSSIVEIS FALHAS NA CONCRETAGEM',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check9 = ICheckList(
    description: 'CONCRETAGEM DE ARRANQUES',
    payAtention: 'CONFERIR FCK CONCRETO',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check10 = ICheckList(
    description: 'DEFORMA DE ARRANQUES',
    payAtention: 'CONFERIR BROCAS E FALHAS DE CONCRETAGEM',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check11 = ICheckList(
    description: 'ARMAÇÃO DE VIGAS E BALDRAMES',
    payAtention:
        'CONFERIR DISTRIBUIÇÃO, ESPAÇAMENTO E UNIÃO DE VIGAS COM VIGAS',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check12 = ICheckList(
    description: 'FUNDO DE VIGAS BALDRAMES',
    payAtention: 'VERIFICAR SE NÃO ESTA EM CONTATO COM SOLO',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check13 = ICheckList(
    description: 'FORMA DE VIGAS BALDRAMES',
    payAtention:
        'CONFERIR TRAVAMENTO DE FORMAS E ALINHAMENTOCONFERIR PASSAGENS HIDROSSANITÁRIAS, ELÉTRICA, REDE E LOGICA.',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check14 = ICheckList(
    description: 'CONCRETAGEM DE VIGAS BALDRAMES',
    payAtention:
        'CONFERIR COBRIMENTO, POSSIVEIS FALHAS DE CONCRETAGEM E VIBRAÇÃO. PENSAR EM LOCAL PARA CHAMAR POÇO',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check15 = ICheckList(
    description: 'DESFORMA DE VIGAS BALDRAMES',
    payAtention: 'CONFERIR BROCAS E FALHAS DE CONCRETAGEM',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check16 = ICheckList(
    description: 'IMPERMEABILIZAÇÃO DE VIGAS BALDRAMES',
    payAtention: 'CONFERIR APLICAÇÃO NAS LATERAIS E SUPERIOR',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check17 = ICheckList(
    description: 'ATERRO ENTRE ELEMENTOS',
    payAtention: 'CONFERIR COMPACTAÇÃO DE 30 EM 30 CM',
    step: 'INFRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check18 = ICheckList(
    description: 'ARMAÇÃO DE PILARES',
    payAtention: 'CONFERIR DISTRIBUIÇÃO E LOCAÇÃO CORRETA NA OBRA',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check19 = ICheckList(
    description: 'FORMA DE PILARES',
    payAtention:
        'CONFERIR COBRIMENTO, POSSIVEIS FALHAS DE CONCRETAGEM E TRAVAMENTO DAS FORMAS.',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check20 = ICheckList(
    description: 'CONCRETAGEM DE PILARES',
    payAtention: 'CONFERIR FCK CONCRETO ',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check21 = ICheckList(
    description: 'DESFORMAS DE PILARES',
    payAtention: 'CONFERIR BROCAS E FALHAS DE CONCRETAGEM',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check22 = ICheckList(
    description: 'ARMAÇÃO DE VIGAS SUPERIORES',
    payAtention:
        'CONFERIR DISTRIBUÇÃO, ESPAÇAMENTO E UNIÃO DE VIGAS COM VIGAS. CONFERIR ALTURA DO PISO ATE O FUNDO DAS VIGAS PARA VERIFICAR SE NÃO IRA ATRAPALHAR O FORRO ',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check23 = ICheckList(
    description: 'FORMA DE VIGAS SUPERIORES',
    payAtention:
        'CONFERIR TRAVAMENTO E ALTURA DAS FORMAS COM RELAÇÃO AO PROJETO, ALEM DO ESPAÇO PARA ENTRADA DOS PREMOLDADOS.CONFERIR PASSAGENS HIDROSSANITÁRIAS, ELETRICAS, REDE E LOGICA',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check24 = ICheckList(
    description: 'CONCRETAGEM DAS VIGAS SUPERIORES',
    payAtention: 'CONFERIR TRAÇO, COBRIMENTO E VIBRAÇÃO.',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check25 = ICheckList(
    description: 'DEFORMA DE VIGAS SUPERIORES',
    payAtention: 'CONFERIR BROCAS E FALHAS DE CONCRETAGEM',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check26 = ICheckList(
    description: 'ESCORAMENTO DE LAJE TRELIÇADA',
    payAtention:
        'CONFERIR ESPAÇAMENTO ENTRE ESCORAS CONFERIR APOIO DAS ESCORAS DIRETO NO PISO CONFERIR ENCONTRO DE ESCORAS COM PREMOLDADO',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check27 = ICheckList(
    description: 'MONTAGEM DE PRE MOLDADOS',
    payAtention:
        'CONFERIR ENCONTRO DE EPS E VIGAS, CONFERIR ALINHAMENTO DE PRE MOLDADOS, CONFERIR PASSAGENS HS, ELE, LOG OU ETC,CONFERIR REFORÇO CASO TENHA,CONFERIR SE NÃO ROMPERAM ESTRIBOS,COMPARAR PERIMETRO DA LAJE REAL COM O PROJETO, INCLUSIVE MEDIR TAMBEM.',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check28 = ICheckList(
    description: 'MONTAGEM DE NERVURAS',
    payAtention:
        'CONFERIR VERGALHAO DENTRO DA NERVURA, CONFERIR FORMA DE FUNDO',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check29 = ICheckList(
    description: 'FORMA DA LAJE',
    payAtention: 'CONFERIR FORMA EXTERNA DA LAJE',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check30 = ICheckList(
    description: 'CONCRETAGEM DA LAJE',
    payAtention:
        'CONFERIR FCK,CONFERIR SPLUM,CONFERIR PONTOS CRITICOS A FALHAS',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check31 = ICheckList(
    description: 'ARMAÇÃO DE PILARES COBERTURA',
    payAtention: 'CONFERIR DISTRIBUIÇÃO E LOCAÇÃO CORRETA NA OBRA',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check32 = ICheckList(
    description: 'ALVENARIA',
    payAtention:
        'CONFERIR LOCAL DE PORTAS, CONFERIR LOCAL DE JANELAS,CONFERIR ALTURA FINAL DA ALVENARIA,CONFERIR ENCUNHAMENTO ,CONFERIR PRUMADA DE PAREDES',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check33 = ICheckList(
    description: 'VERGAS E CONTRA VERGAS',
    payAtention:
        'CONFERIR VERGAS EM JANELAS E PORTAS, CONFERIR SE TEM TUBO DE PASSAGEM CIMA P/BAIXO',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check34 = ICheckList(
    description: 'FORMA DE PILARES COBERTURA',
    payAtention:
        'CONFERIR COBRIMENTO, POSSIVEIS FALHAS DE CONCRETAGEM E TRAVAMENTO DAS FORMAS.',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check35 = ICheckList(
    description: 'CONCRETAGEM DE PILARES COBERTURA',
    payAtention: 'CONFERIR FCK CONCRETO ',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check36 = ICheckList(
    description: 'DESFORMAS DE PILARES COBERTURA',
    payAtention: 'CONFERIR BROCAS E FALHAS DE CONCRETAGEM',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check37 = ICheckList(
    description: 'ARMAÇÃO DE VIGAS COBERTURA',
    payAtention:
        'CONFERIR DISTRIBUÇÃO, ESPAÇAMENTO E UNIÃO DE VIGAS COM VIGAS. CONFERIR ALTURA DO PISO ATE O FUNDO DAS VIGAS PARA VERIFICAR SE NÃO IRA ATRAPALHAR O FORRO ',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check38 = ICheckList(
    description: 'FORMA DE VIGAS COBERTURA',
    payAtention:
        'CONFERIR TRAVAMENTO E ALTURA DAS FORMAS COM RELAÇÃO AO PROJETO, ALEM DO ESPAÇO PARA ENTRADA DOS PREMOLDADOS.CONFERIR PASSAGENS HIDROSSANITÁRIAS, ELETRICAS, REDE E LOGICA',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check39 = ICheckList(
    description: 'FORMA DE VIGAS COBERTURA',
    payAtention: 'CONFERIR TRAÇO, COBRIMENTO E VIBRAÇÃO.',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check40 = ICheckList(
    description: 'DEFORMA DE VIGAS COBERTURA',
    payAtention: 'CONFERIR BROCAS E FALHAS DE CONCRETAGEM',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check41 = ICheckList(
    description: 'ESCORAMENTO DE LAJE TRELIÇADA',
    payAtention:
        'CONFERIR ESPAÇAMENTO ENTRE ESCORAS,CONFERIR APOIO DAS ESCORAS DIRETO NO PISO,CONFERIR ENCONTRO DE ESCORAS COM PREMOLDADO',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check42 = ICheckList(
    description: 'MONTAGEM DE PRE MOLDADOS',
    payAtention:
        'CONFERIR ENCONTRO DE EPS E VIGAS,CONFERIR ALINHAMENTO DE PRE MOLDADOS,CONFERIR PASSAGENS ,CONFERIR REFORÇO CASO TENHA,CONFERIR SE NÃO ROMPERAM ESTRIBOS',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check43 = ICheckList(
    description: 'MONTAGEM DE NERVURAS',
    payAtention:
        'CONFERIR VERGALHAO DENTRO DA NERVURA, CONFERIR FORMA DE FUNDO',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check44 = ICheckList(
    description: 'FORMA DA LAJE',
    payAtention: 'CONFERIR FORMA EXTERNA DA LAJE',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check45 = ICheckList(
    description: 'CONCRETAGEM DA LAJE',
    payAtention:
        'CONFERIR FCK,CONFERIR SPLUM,CONFERIR PONTOS CRITICOS A FALHAS ',
    step: 'SUPRAESTRUTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check46 = ICheckList(
    description: 'ALVENARIA',
    payAtention:
        'CONFERIR LOCAIS DE PORTAS ,CONFERIR LOCAIS DE JANELAS,CONFERIR ALTURA FINAL DA ALVENARIA,CONFERIR ENCUNHAMENTO ,CONFERIR PRUMADA DE PAREDES,CONFERIR SE ALTURA FINAL DAS PORTAS ESTAO ALINHADAS COM AS OUTRAS, O MESMO PARA JANELAS,CONFERIR CENTRALIZAÇÃO DE JANELAS E PORTAS',
    step: 'ALVENARIA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check47 = ICheckList(
    description: 'TUBULAÇÃO ESGOTO',
    payAtention:
        'CONFERIR INCLINAÇÃO, CONFERIR LIGAÇÃO PARA NÃO VOLTAR MAL CHEIRO, CONFERIR CAIXAS DE PASSAGEM',
    step: 'INST.HS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check48 = ICheckList(
    description: 'RALOS',
    payAtention:
        'VERIFICAR SE RALOS NÃO ESTÃO PROXIMOS DEMAIS DO BOX, CONFERIR SE TODOS OS LOCAIS POSSUEM OS RALOS COMO DESEJADO',
    step: 'INST.HS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check49 = ICheckList(
    description: 'VERGAS E CONTRA VERGAS',
    payAtention: 'CONFERIR VERGAS EM JANELAS E PORTAS',
    step: 'ALVENARIA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check50 = ICheckList(
    description: 'ESTRUTURA DA CAIXA DAGUA',
    payAtention: 'CONFERIR DIMENSÃO COM O PROJ. ARQ',
    step: 'COBERTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check51 = ICheckList(
    description: 'ESTRUTURA DE COBERTURA',
    payAtention: 'CONFERIR ESPAÇAMENTOS E APOIOS',
    step: 'COBERTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check52 = ICheckList(
    description: 'TELHAMENTO',
    payAtention: 'CONFERIR TIPO DE PARAFUSO UTILIZADO,CONFERIR TRANSPASSE',
    step: 'COBERTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check53 = ICheckList(
    description: 'RUFOS',
    payAtention: 'CONFERIR EXECUÇÃO ',
    step: 'COBERTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check54 = ICheckList(
    description: 'CALHAS',
    payAtention: 'CONFERIR IMPERMEABILIZAÇÃO E QUEDA',
    step: 'COBERTURA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check55 = ICheckList(
    description: 'INST. CAIXAS 4X2',
    payAtention:
        'CONFERIR O QUE FOI EXECUTADO COM O QUE TEM NO PROJETO,CONFERIR PONTOS ESPECIFICOS COMO ABAJUR E ARANDELA,CONFERIR PONTOS DE CORTINEIRO,CONFERIR PONTOS DE LED,CONFERIR LUMINARIAS QUE SERÃO EMBUTIDAS',
    step: 'INST.ELÉTRICA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check56 = ICheckList(
    description: 'TUBULAÇÃO DE AGUA FRIA',
    payAtention:
        'CONFERIR QUANTIDADE DE CURVAS E JOELHOS ,CONFERIR EXECUÇÃO,CONFERIR REGISTROS,CONFERIR PONTO DE BEBEDOUROS',
    step: 'INST.HS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check57 = ICheckList(
    description: 'INST. CAIXA DAGUA',
    payAtention: 'CONFERIR LIGAÇÃO COM FLANGE, CONFERIR REGISTROS ',
    step: 'INST.HS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check58 = ICheckList(
    description: 'PRE INSTALAÇÃO DAS CENTRAIS DE AR',
    payAtention:
        'CONFERIR SE AS CAIXAS DE SPLIT ESTÃO 40 ABAIXO DO FORRO,CONFERIR CAMINHO DOS DRENOS PARA RALOS',
    step: 'INST.HS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _check59 = ICheckList(
    description: 'CHAPISCO/EMBOÇO/REBOCO INTERNO',
    payAtention:
        'CONFERIR CHAPISCO EM PAREDES,CONFERIR PRUMO E TARISCAS NO REBOCO,CONFERIR PRUMADA DE REBOCOS,CONFERIR USO DE IMPER. EM REBOCOS ESPECIFICOS',
    step: 'REBOCO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList60 = ICheckList(
    description: 'CHAPISCO/EMBOÇO/REBOCO INTERNO',
    payAtention:
        'CONFERIR CHAPISCO EM PAREDES, CONFERIR PRUMO E TARISCAS NO REBOCO,CONFERIR PRUMADA DE REBOCOS,CONFERIR USO DE IMPER. EM REBOCOS ESPECIFICOS,CONFERIR NICHOS CASO TENHA',
    step: 'REBOCO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList61 = ICheckList(
    description: 'ASSENTAMENTO DE PORTAIS',
    payAtention: 'CONFERIR SE TODOS OS AMBIENTES POSSUEM',
    step: 'ESQUADRIAS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList62 = ICheckList(
    description: 'CONTRA PISO',
    payAtention: 'CONFERIR QUEDA PARA O RALO, CONFERIR DESNIVEIS',
    step: 'PISO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList63 = ICheckList(
    description: 'PASSAGEM DE CABOS ELÉTRICOS',
    payAtention:
        'CONFERIR CABO EXTRA PARA FASE, CONFERIR PASSAGEM EM TODOS OS PONTOS,CONFERIR UTILIZAÇÃO DE CORES CORRETO,VERIFICAR PASSAGEM DE REDE E LOGICA',
    step: 'INST. ELÉTRICA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList64 = ICheckList(
    description: 'FORRO',
    payAtention:
        'CONFERIR NIVEL DE FORRO EM RELAÇÃO A FUNDO DE VIGAS OU ETC,CONFERIR DESIGN COM O PROJ. ARQ,CONFERIR SANCAS,CONFERIR CORTINEIROS(VERIFICAR SE NÃO POSSUI NENHUM OBSTACULO NO CAMINHO),CONFERIR SE NÃO DEIXOU NENHUM PONTO ESCONDIDO,CONFERIR ALTURA DE TODOS OS FORROS,AVISAR OS PONTOS PARA QUE NÃO HAJA INTERFERENCIA DA ESTRUTURA COM PONTOS DE ILUMINAÇÃO',
    step: 'FORRO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList65 = ICheckList(
    description: 'ASSENT. PISO PORCELANATO ',
    payAtention:
        'CONFERIR USO DE CUNHA E ESPAÇADOR,CONFERIR LOCAL DE SAIDA COM O PROJETADO,CONFERIR SE O RODAPÉ É EMBUTIDO OU SOBREPOR,CONFERIR INCLINAÇÃO NOS BANHEIROS PARA OS RALOS ,CONFERIR SE AS PEÇAS SÃO DA MESMA DIMENSÃO PARA QUE NÃO HAJA DIVERGENCIA,EXECUTAR PROTEÇÃO DE ÁREA QUE POSSUEM MOVIMENTAÇÃO DE TRABALHADORES,EXECUTAR PROTEÇÃO DE ÁREA QUE POSSUEM MOVIMENTAÇÃO DE TRABALHADORES,CONFERIR QUALIDADE DE MEIA ESQUADRIA',
    step: 'PISO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList66 = ICheckList(
    description: 'ASSENT. REVET. PAREDE PORCELANATO',
    payAtention:
        'CONFERIR USO DE CUNHA E ESPAÇADOR,CONFERIR LOCAL DE SAIDA COM O PROJETADO,CONFERIR DETALHES DE CADA BANHEIRO,COZINHA E ÁREA DE SERVIÇO,VERIFICAR SE PORCELANATO TAMBEM FECHA ABAS DAS JANELAS OU SERÁ DE PEDRA,VERIFICAR SE FUNDO DOS NICHOS SERÃO DE PORCELANATO,CONFERIR SE AS PEÇAS SÃO DA MESMA DIMENSÃO PARA QUE NÃO HAJA DIVERGENCIA,CONFERIR QUALIDADE DE MEIA ESQUADRIA',
    step: 'REVESTIMENTO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList67 = ICheckList(
    description: 'PEITORIS E SOLEIRAS',
    payAtention:
        'VERIFICAR NIVEL DE ASSENTAMENTO CONFERIR SE TODOS OS LOCAIS ESTAO CORRETOS',
    step: 'PISOS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList68 = ICheckList(
    description: 'PINTURA INTERNA',
    payAtention:
        'VERIFICAR CORES DE CADA AMBIENTE,ESPECIFICAR MASSA CORRIDA PARA INTERNA E ACRILICA PARA EXTERNA,VERIFICAR SE HOUVE DUAS DEMÃOS E LIXAMENTO,VERIFICAR APLICAÇÃO DE SELADOR,CONFERIR DEMÃOS DE APLICAÇÃO DE TINTA NOS AMBIENTES PARA EVITAR FALHAS',
    step: 'REVESTIMENTO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList69 = ICheckList(
    description: 'REVESTIMENTOS ESPECIAIS',
    payAtention:
        'VERIFICAR LOCAL EXATO DE ASSENTAMENTO OU APLICAÇÃO DE TEXTURA',
    step: 'REVESTIMENTO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList70 = ICheckList(
    description: 'PINTURA EXTERNA',
    payAtention:
        'EXPLICAR E VERIFICAR TECNICAS DE APLICAÇÃO PARA EVITAR EMENDAS, VERIFICAR O CUSTO BENEFICIO DE APLICAR BASE DE TEXTURA BRANCA E APÓS PINTAR A COR DESEJADA',
    step: 'REVESTIMENTO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList71 = ICheckList(
    description: 'INST.LOUÇAS',
    payAtention:
        'CONFERIR SE TODOS AS BACIAS SANITARIAS FORAM INSTALADAS E POSSUEM ANEL DE VEDAÇÃO,CONFERIR SE TODAS AS TORNEIRAS FORAM INSTALADAS E USARAM VEDAROSCA',
    step: 'INST.HS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList72 = ICheckList(
    description: 'INST. TOMADAS, INTERRUPTORES E LUMINARIAS',
    payAtention:
        'CONFERIR MARCA E INSTALAÇÃO CORRETA DOS PONTOS, PREVER PROTEÇÃO DO PISO QUANDO NECESSARIO',
    step: 'INST.ELÉTRICA',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList73 = ICheckList(
    description: 'VIDROS',
    payAtention:
        'CONFERIR MANUSEIO DE JANELAS E PORTAS,CONFERIR PROTEÇÃO DO PISO QUANDO NECESSARIO',
    step: 'ESQUADRARIAS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList74 = ICheckList(
    description: 'ESQUADRIAS DE MADEIRA',
    payAtention:
        'CONFERIR ACABAMENTO DE VERNIZ,CONFERIR ACABAMENTO LAQUEADO CASO HAJA,CONFERIR FECHADURAS ',
    step: 'ESQUADRARIAS',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList75 = ICheckList(
    description: 'PAISAGISMO',
    payAtention:
        'VERIFICAR ÁREA DE GRAMA PARA DEIXAR REGULARIZADO PARA RECEBER',
    step: 'PAISAGISMO',
    percentageCompleted: 0,
    workId: workId,
  );

  var _checkList76 = ICheckList(
    description: 'ESTRUTUTA DA PISCINA',
    payAtention:
        'VERIFICAR ESQUADRO DA PISCINA, CONFERIR NIVEL DOS PONTOS DE HIDRO,CONFERIR SE CALHA DA BORDA INFINITA POSSUI VOLUME EXIGIDO,CONFERIR DIMENSÕES DA PISCINA COM ESPECIFICADO EM PROJETO',
    step: 'PISCINA',
    percentageCompleted: 0,
    workId: workId,
  );

  List<ICheckList> checkLists = [
    _check1,
    _check2,
    _check3,
    _check4,
    _check5,
    _check6,
    _check7,
    _check8,
    _check9,
    _check10,
    _check11,
    _check12,
    _check13,
    _check14,
    _check15,
    _check16,
    _check17,
    _check18,
    _check19,
    _check20,
    _check21,
    _check22,
    _check23,
    _check24,
    _check25,
    _check26,
    _check27,
    _check28,
    _check29,
    _check30,
    _check31,
    _check32,
    _check33,
    _check34,
    _check35,
    _check36,
    _check37,
    _check38,
    _check39,
    _check40,
    _check41,
    _check42,
    _check43,
    _check44,
    _check45,
    _check46,
    _check47,
    _check48,
    _check49,
    _check50,
    _check51,
    _check52,
    _check53,
    _check54,
    _check55,
    _check56,
    _check57,
    _check58,
    _check59,
    _checkList60,
    _checkList61,
    _checkList62,
    _checkList63,
    _checkList64,
    _checkList65,
    _checkList66,
    _checkList67,
    _checkList68,
    _checkList69,
    _checkList70,
    _checkList71,
    _checkList72,
    _checkList73,
    _checkList74,
    _checkList75,
    _checkList76,
  ];

  return checkLists;
}
