// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_dashboard_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $WorkDashboardController = BindInject(
  (i) => WorkDashboardController(i<ICheckListService>(), i<IWorkService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkDashboardController on _WorkDashboardControllerBase, Store {
  final _$completedItensAtom =
      Atom(name: '_WorkDashboardControllerBase.completedItens');

  @override
  ObservableFuture<List<ICheckList>> get completedItens {
    _$completedItensAtom.reportRead();
    return super.completedItens;
  }

  @override
  set completedItens(ObservableFuture<List<ICheckList>> value) {
    _$completedItensAtom.reportWrite(value, super.completedItens, () {
      super.completedItens = value;
    });
  }

  final _$incompletedItensAtom =
      Atom(name: '_WorkDashboardControllerBase.incompletedItens');

  @override
  ObservableFuture<List<ICheckList>> get incompletedItens {
    _$incompletedItensAtom.reportRead();
    return super.incompletedItens;
  }

  @override
  set incompletedItens(ObservableFuture<List<ICheckList>> value) {
    _$incompletedItensAtom.reportWrite(value, super.incompletedItens, () {
      super.incompletedItens = value;
    });
  }

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

  final _$getCheckListsAsyncAction =
      AsyncAction('_WorkDashboardControllerBase.getCheckLists');

  @override
  Future getCheckLists() {
    return _$getCheckListsAsyncAction.run(() => super.getCheckLists());
  }

  final _$getCompletedCheckListsAsyncAction =
      AsyncAction('_WorkDashboardControllerBase.getCompletedCheckLists');

  @override
  Future getCompletedCheckLists() {
    return _$getCompletedCheckListsAsyncAction
        .run(() => super.getCompletedCheckLists());
  }

  final _$getIncompletedCheckListsAsyncAction =
      AsyncAction('_WorkDashboardControllerBase.getIncompletedCheckLists');

  @override
  Future getIncompletedCheckLists() {
    return _$getIncompletedCheckListsAsyncAction
        .run(() => super.getIncompletedCheckLists());
  }

  @override
  String toString() {
    return '''
completedItens: ${completedItens},
incompletedItens: ${incompletedItens},
checkLists: ${checkLists}
    ''';
  }
}
