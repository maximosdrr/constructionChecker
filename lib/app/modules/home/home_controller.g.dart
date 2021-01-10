// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IWorkRepo>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$worksAtom = Atom(name: '_HomeControllerBase.works');

  @override
  ObservableFuture<List<IWork>> get works {
    _$worksAtom.reportRead();
    return super.works;
  }

  @override
  set works(ObservableFuture<List<IWork>> value) {
    _$worksAtom.reportWrite(value, super.works, () {
      super.works = value;
    });
  }

  final _$selectedWorkAtom = Atom(name: '_HomeControllerBase.selectedWork');

  @override
  IWork get selectedWork {
    _$selectedWorkAtom.reportRead();
    return super.selectedWork;
  }

  @override
  set selectedWork(IWork value) {
    _$selectedWorkAtom.reportWrite(value, super.selectedWork, () {
      super.selectedWork = value;
    });
  }

  final _$getWorksAsyncAction = AsyncAction('_HomeControllerBase.getWorks');

  @override
  Future getWorks() {
    return _$getWorksAsyncAction.run(() => super.getWorks());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic selectWork(IWork work) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.selectWork');
    try {
      return super.selectWork(work);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
works: ${works},
selectedWork: ${selectedWork}
    ''';
  }
}
