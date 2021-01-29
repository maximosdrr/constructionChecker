// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_requirement_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MaterialRequirementController = BindInject(
  (i) => MaterialRequirementController(i<MaterialRequirementPdfService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaterialRequirementController
    on _MaterialRequirementControllerBase, Store {
  final _$workAtom = Atom(name: '_MaterialRequirementControllerBase.work');

  @override
  String get work {
    _$workAtom.reportRead();
    return super.work;
  }

  @override
  set work(String value) {
    _$workAtom.reportWrite(value, super.work, () {
      super.work = value;
    });
  }

  final _$clientAtom = Atom(name: '_MaterialRequirementControllerBase.client');

  @override
  String get client {
    _$clientAtom.reportRead();
    return super.client;
  }

  @override
  set client(String value) {
    _$clientAtom.reportWrite(value, super.client, () {
      super.client = value;
    });
  }

  final _$materialListAtom =
      Atom(name: '_MaterialRequirementControllerBase.materialList');

  @override
  ObservableList<IMaterial> get materialList {
    _$materialListAtom.reportRead();
    return super.materialList;
  }

  @override
  set materialList(ObservableList<IMaterial> value) {
    _$materialListAtom.reportWrite(value, super.materialList, () {
      super.materialList = value;
    });
  }

  final _$generateMaterialRequirementReportAsyncAction = AsyncAction(
      '_MaterialRequirementControllerBase.generateMaterialRequirementReport');

  @override
  Future generateMaterialRequirementReport(File logo) {
    return _$generateMaterialRequirementReportAsyncAction
        .run(() => super.generateMaterialRequirementReport(logo));
  }

  final _$_MaterialRequirementControllerBaseActionController =
      ActionController(name: '_MaterialRequirementControllerBase');

  @override
  dynamic addMaterial(IMaterial material) {
    final _$actionInfo = _$_MaterialRequirementControllerBaseActionController
        .startAction(name: '_MaterialRequirementControllerBase.addMaterial');
    try {
      return super.addMaterial(material);
    } finally {
      _$_MaterialRequirementControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeMaterial(int index) {
    final _$actionInfo = _$_MaterialRequirementControllerBaseActionController
        .startAction(name: '_MaterialRequirementControllerBase.removeMaterial');
    try {
      return super.removeMaterial(index);
    } finally {
      _$_MaterialRequirementControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
work: ${work},
client: ${client},
materialList: ${materialList}
    ''';
  }
}
