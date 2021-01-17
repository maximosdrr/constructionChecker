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

  final _$generatePdfAsyncAction =
      AsyncAction('_ReportsControllerBase.generatePdf');

  @override
  Future generatePdf(IReport report) {
    return _$generatePdfAsyncAction.run(() => super.generatePdf(report));
  }

  @override
  String toString() {
    return '''
generated: ${generated}
    ''';
  }
}
