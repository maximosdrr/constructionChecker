import 'dart:io';

import 'package:constructionChecker/models/material.dart';
import 'package:constructionChecker/services/material_requirement_pdf/material_requirement_pdf_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'material_requirement_controller.g.dart';

@Injectable()
class MaterialRequirementController = _MaterialRequirementControllerBase
    with _$MaterialRequirementController;

abstract class _MaterialRequirementControllerBase with Store {
  final MaterialRequirementPdfService materialRequirementPdfService;

  _MaterialRequirementControllerBase(this.materialRequirementPdfService);

  @observable
  String work = '';

  @observable
  String client = '';

  @observable
  ObservableList<IMaterial> materialList = ObservableList();

  @action
  addMaterial(IMaterial material) {
    materialList.add(material);
  }

  @action
  removeMaterial(int index) {
    materialList.removeAt(index);
  }

  @action
  generateMaterialRequirementReport(File logo) async {
    await this
        .materialRequirementPdfService
        .save(this.materialList, this.work, this.client, logo);
  }
}
