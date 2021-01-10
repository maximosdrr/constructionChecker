import 'check_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'check_list_page.dart';

class CheckListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CheckListController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CheckListPage()),
      ];

  static Inject get to => Inject<CheckListModule>.of();
}
