import 'corner_stone_history_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'corner_stone_history_page.dart';

class CornerStoneHistoryModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CornerStoneHistoryController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CornerStoneHistoryPage()),
      ];

  static Inject get to => Inject<CornerStoneHistoryModule>.of();
}
