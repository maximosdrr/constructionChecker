// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_list_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CheckListController = BindInject(
  (i) => CheckListController(i<ICheckListRepo>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckListController on _CheckListControllerBase, Store {
  final _$checkListsAtom = Atom(name: '_CheckListControllerBase.checkLists');

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
      AsyncAction('_CheckListControllerBase.getCheckLists');

  @override
  Future getCheckLists() {
    return _$getCheckListsAsyncAction.run(() => super.getCheckLists());
  }

  @override
  String toString() {
    return '''
checkLists: ${checkLists}
    ''';
  }
}
