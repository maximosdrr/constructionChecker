// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_dashboard_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $WorkDashboardController = BindInject(
  (i) => WorkDashboardController(
      i<ICheckListService>(),
      i<IWorkService>(),
      i<IWorkCornerStoneService>(),
      i<ICornerStoneService>(),
      i<ProgressionPdfService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkDashboardController on _WorkDashboardControllerBase, Store {
  final _$checkListsAtom =
      Atom(name: '_WorkDashboardControllerBase.checkLists');

  @override
  ObservableFuture<List<ICheckList>> get checkLists {
    _$checkListsAtom.reportRead();
    return super.checkLists;
  }

  @override
  set checkLists(ObservableFuture<List<ICheckList>> value) {
    _$checkListsAtom.reportWrite(value, super.checkLists, () {
      super.checkLists = value;
    });
  }

  final _$workCornerStonesAtom =
      Atom(name: '_WorkDashboardControllerBase.workCornerStones');

  @override
  ObservableFuture<List<IWorkCornerStone>> get workCornerStones {
    _$workCornerStonesAtom.reportRead();
    return super.workCornerStones;
  }

  @override
  set workCornerStones(ObservableFuture<List<IWorkCornerStone>> value) {
    _$workCornerStonesAtom.reportWrite(value, super.workCornerStones, () {
      super.workCornerStones = value;
    });
  }

  final _$cornerStonesAvgAtom =
      Atom(name: '_WorkDashboardControllerBase.cornerStonesAvg');

  @override
  ObservableFuture<List<ICornerStoneAvg>> get cornerStonesAvg {
    _$cornerStonesAvgAtom.reportRead();
    return super.cornerStonesAvg;
  }

  @override
  set cornerStonesAvg(ObservableFuture<List<ICornerStoneAvg>> value) {
    _$cornerStonesAvgAtom.reportWrite(value, super.cornerStonesAvg, () {
      super.cornerStonesAvg = value;
    });
  }

  final _$selectedCornerStoneAvgAtom =
      Atom(name: '_WorkDashboardControllerBase.selectedCornerStoneAvg');

  @override
  ICornerStoneAvg get selectedCornerStoneAvg {
    _$selectedCornerStoneAvgAtom.reportRead();
    return super.selectedCornerStoneAvg;
  }

  @override
  set selectedCornerStoneAvg(ICornerStoneAvg value) {
    _$selectedCornerStoneAvgAtom
        .reportWrite(value, super.selectedCornerStoneAvg, () {
      super.selectedCornerStoneAvg = value;
    });
  }

  final _$getCheckListsAsyncAction =
      AsyncAction('_WorkDashboardControllerBase.getCheckLists');

  @override
  Future getCheckLists() {
    return _$getCheckListsAsyncAction.run(() => super.getCheckLists());
  }

  final _$getCornerStoneAvgAsyncAction =
      AsyncAction('_WorkDashboardControllerBase.getCornerStoneAvg');

  @override
  Future getCornerStoneAvg() {
    return _$getCornerStoneAvgAsyncAction.run(() => super.getCornerStoneAvg());
  }

  final _$_WorkDashboardControllerBaseActionController =
      ActionController(name: '_WorkDashboardControllerBase');

  @override
  dynamic getWorkCornerStones() {
    final _$actionInfo = _$_WorkDashboardControllerBaseActionController
        .startAction(name: '_WorkDashboardControllerBase.getWorkCornerStones');
    try {
      return super.getWorkCornerStones();
    } finally {
      _$_WorkDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkLists: ${checkLists},
workCornerStones: ${workCornerStones},
cornerStonesAvg: ${cornerStonesAvg},
selectedCornerStoneAvg: ${selectedCornerStoneAvg}
    ''';
  }
}
