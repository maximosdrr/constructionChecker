// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corner_stone_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CornerStoneController = BindInject(
  (i) => CornerStoneController(i<ICornerStoneService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CornerStoneController on _CornerStoneControllerBase, Store {
  final _$cornerStonesAtom =
      Atom(name: '_CornerStoneControllerBase.cornerStones');

  @override
  ObservableFuture<List<ICornerStone>> get cornerStones {
    _$cornerStonesAtom.reportRead();
    return super.cornerStones;
  }

  @override
  set cornerStones(ObservableFuture<List<ICornerStone>> value) {
    _$cornerStonesAtom.reportWrite(value, super.cornerStones, () {
      super.cornerStones = value;
    });
  }

  final _$getCornerStonesAsyncAction =
      AsyncAction('_CornerStoneControllerBase.getCornerStones');

  @override
  Future getCornerStones() {
    return _$getCornerStonesAsyncAction.run(() => super.getCornerStones());
  }

  @override
  String toString() {
    return '''
cornerStones: ${cornerStones}
    ''';
  }
}
