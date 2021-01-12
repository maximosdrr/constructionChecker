import 'work_dashboard_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'work_dashboard_page.dart';

class WorkDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $WorkDashboardController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => WorkDashboardPage()),
      ];

  static Inject get to => Inject<WorkDashboardModule>.of();
}
