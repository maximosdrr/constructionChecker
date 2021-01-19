// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ReportsController = BindInject(
  (i) => ReportsController(i<PdfService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportsController on _ReportsControllerBase, Store {
  final _$generatedAtom = Atom(name: '_ReportsControllerBase.generated');

  @override
  bool get generated {
    _$generatedAtom.reportRead();
    return super.generated;
  }

  @override
  set generated(bool value) {
    _$generatedAtom.reportWrite(value, super.generated, () {
      super.generated = value;
    });
  }

  final _$reportToPrintAtom =
      Atom(name: '_ReportsControllerBase.reportToPrint');

  @override
  IReport get reportToPrint {
    _$reportToPrintAtom.reportRead();
    return super.reportToPrint;
  }

  @override
  set reportToPrint(IReport value) {
    _$reportToPrintAtom.reportWrite(value, super.reportToPrint, () {
      super.reportToPrint = value;
    });
  }

  final _$maoDeObraAtom = Atom(name: '_ReportsControllerBase.maoDeObra');

  @override
  ObservableList<MaoDeObra> get maoDeObra {
    _$maoDeObraAtom.reportRead();
    return super.maoDeObra;
  }

  @override
  set maoDeObra(ObservableList<MaoDeObra> value) {
    _$maoDeObraAtom.reportWrite(value, super.maoDeObra, () {
      super.maoDeObra = value;
    });
  }

  final _$statusAtom = Atom(name: '_ReportsControllerBase.status');

  @override
  ObservableList<Status> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ObservableList<Status> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$materiaisRecebidosAtom =
      Atom(name: '_ReportsControllerBase.materiaisRecebidos');

  @override
  ObservableList<String> get materiaisRecebidos {
    _$materiaisRecebidosAtom.reportRead();
    return super.materiaisRecebidos;
  }

  @override
  set materiaisRecebidos(ObservableList<String> value) {
    _$materiaisRecebidosAtom.reportWrite(value, super.materiaisRecebidos, () {
      super.materiaisRecebidos = value;
    });
  }

  final _$imagensAdicionadasAtom =
      Atom(name: '_ReportsControllerBase.imagensAdicionadas');

  @override
  ObservableList<FotoAdicionada> get imagensAdicionadas {
    _$imagensAdicionadasAtom.reportRead();
    return super.imagensAdicionadas;
  }

  @override
  set imagensAdicionadas(ObservableList<FotoAdicionada> value) {
    _$imagensAdicionadasAtom.reportWrite(value, super.imagensAdicionadas, () {
      super.imagensAdicionadas = value;
    });
  }

  final _$generatePdfAsyncAction =
      AsyncAction('_ReportsControllerBase.generatePdf');

  @override
  Future generatePdf(IReport report) {
    return _$generatePdfAsyncAction.run(() => super.generatePdf(report));
  }

  final _$finishAsyncAction = AsyncAction('_ReportsControllerBase.finish');

  @override
  Future finish() {
    return _$finishAsyncAction.run(() => super.finish());
  }

  final _$_ReportsControllerBaseActionController =
      ActionController(name: '_ReportsControllerBase');

  @override
  dynamic addPhoto(FotoAdicionada fotoAdicionada) {
    final _$actionInfo = _$_ReportsControllerBaseActionController.startAction(
        name: '_ReportsControllerBase.addPhoto');
    try {
      return super.addPhoto(fotoAdicionada);
    } finally {
      _$_ReportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
generated: ${generated},
reportToPrint: ${reportToPrint},
maoDeObra: ${maoDeObra},
status: ${status},
materiaisRecebidos: ${materiaisRecebidos},
imagensAdicionadas: ${imagensAdicionadas}
    ''';
  }
}
