import 'package:constructionChecker/models/cornerstone.dart';
import 'package:constructionChecker/services/corner_stone/icorner_stone_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'corner_stone_controller.g.dart';

@Injectable()
class CornerStoneController = _CornerStoneControllerBase
    with _$CornerStoneController;

abstract class _CornerStoneControllerBase with Store {
  final ICornerStoneService cornerStoneService;
  _CornerStoneControllerBase(this.cornerStoneService) {
    getCornerStones();
  }

  @observable
  ObservableFuture<List<ICornerStone>> cornerStones =
      ObservableFuture.value([]);

  @action
  getCornerStones() async {
    cornerStones = cornerStoneService.findMany().asObservable();
  }

  insertCornerStone(ICornerStone cornerStone) async {
    return await cornerStoneService.insert(cornerStone);
  }

  deleteCornerStone(id) async {
    return await cornerStoneService.delete(id);
  }

  updateCornerStone(ICornerStone cornerStone) async {
    return await cornerStoneService.update(cornerStone);
  }
}
