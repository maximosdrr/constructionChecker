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
    _check11
  ];

  return checkLists;
}
