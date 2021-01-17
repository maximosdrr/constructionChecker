import 'reports_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'reports_page.dart';

class ReportsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ReportsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ReportsPage()),
      ];

  static Inject get to => Inject<ReportsModule>.of();
}
