import 'package:constructionChecker/app/modules/reports/pages/fase_1.dart';
import 'package:constructionChecker/app/modules/reports/pages/fase_2.dart';

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
        ModularRouter('/fase1', child: (_, args) => ReportPashe1()),
        ModularRouter('/fase2', child: (_, args) => ReportPashe2()),
      ];

  static Inject get to => Inject<ReportsModule>.of();
}
