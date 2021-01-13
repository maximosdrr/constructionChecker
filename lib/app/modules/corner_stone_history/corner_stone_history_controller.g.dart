// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corner_stone_history_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CornerStoneHistoryController = BindInject(
  (i) => CornerStoneHistoryController(i<WorkCornerStoneService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CornerStoneHistoryController
    on _CornerStoneHistoryControllerBase, Store {
  final _$workCornerStonesAtom =
      Atom(name: '_CornerStoneHistoryControllerBase.workCornerStones');

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

  final _$findManyByCornerStoneAsyncAction =
      AsyncAction('_CornerStoneHistoryControllerBase.findManyByCornerStone');

  @override
  Future findManyByCornerStone() {
    return _$findManyByCornerStoneAsyncAction
        .run(() => super.findManyByCornerStone());
  }

  @override
  String toString() {
    return '''
workCornerStones: ${workCornerStones}
    ''';
  }
}
