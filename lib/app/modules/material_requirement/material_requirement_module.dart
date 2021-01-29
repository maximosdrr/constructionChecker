import 'material_requirement_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'material_requirement_page.dart';

class MaterialRequirementModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MaterialRequirementController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MaterialRequirementPage()),
      ];

  static Inject get to => Inject<MaterialRequirementModule>.of();
}
