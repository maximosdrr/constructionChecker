import 'corner_stone_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'corner_stone_page.dart';

class CornerStoneModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CornerStoneController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CornerStonePage()),
      ];

  static Inject get to => Inject<CornerStoneModule>.of();
}
