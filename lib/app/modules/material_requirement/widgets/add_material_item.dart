import 'package:constructionChecker/app/modules/material_requirement/material_requirement_controller.dart';
import 'package:constructionChecker/models/material.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddMaterialItemDialog extends StatelessWidget {
  AddMaterialItemDialog({Key key}) : super(key: key);
  final _controller = Modular.get<MaterialRequirementController>();

  final _nameController = TextEditingController();
  final _stepController = TextEditingController();
  final _unityController = TextEditingController();
  final _quantityController = TextEditingController();
  final _statusController = TextEditingController();
  final _observationController = TextEditingController();
  final _brandController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Adicionar Material"),
      ),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              AppTextField(
                hintText: 'Nome',
                controller: _nameController,
              ),
              AppTextField(
                hintText: 'Etapa',
                controller: _stepController,
              ),
              AppTextField(
                hintText: 'Unidade',
                controller: _unityController,
              ),
              AppTextField(
                hintText: 'Quantidade',
                controller: _quantityController,
              ),
              AppTextField(
                hintText: 'Status',
                controller: _statusController,
              ),
              AppTextField(
                hintText: 'Observação',
                controller: _observationController,
              ),
              AppTextField(
                hintText: 'Marca',
                controller: _brandController,
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Modular.to.pop(),
        ),
        FlatButton(
          child: Text("Adicionar"),
          onPressed: () {
            var _materialToAdd = IMaterial(
              name: _nameController.text,
              brand: _brandController.text,
              observation: _observationController.text,
              quantity: _quantityController.text,
              status: _statusController.text,
              step: _stepController.text,
              unity: _unityController.text,
            );
            print(_materialToAdd);
            _controller.addMaterial(_materialToAdd);
            Modular.to.pop();
          },
        )
      ],
    );
  }
}
