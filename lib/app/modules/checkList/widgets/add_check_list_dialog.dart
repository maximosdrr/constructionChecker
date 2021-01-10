import 'package:constructionChecker/app/modules/checkList/check_list_controller.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddCheckListDialog extends StatelessWidget {
  final _descriptionController = TextEditingController();
  final _payAtentionController = TextEditingController();
  final _stepController = TextEditingController();
  final _observationsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _checkListController = Modular.get<CheckListController>();
  AddCheckListDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        title: Text("Adicionar"),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                hintText: 'Descrição',
                controller: _descriptionController,
                validator: (String value) {
                  if (value.length < 3) {
                    return 'O campo deve conter 3 caracteres';
                  }

                  return null;
                },
              ),
              AppTextField(
                hintText: 'Etapa',
                controller: _stepController,
                validator: (String value) {
                  if (value.length < 3) {
                    return 'O campo deve conter 3 caracteres';
                  }

                  return null;
                },
              ),
              AppTextField(
                hintText: 'Prestar Atenção',
                controller: _payAtentionController,
              ),
              AppTextField(
                hintText: 'Observações',
                controller: _observationsController,
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
          child: Text("Salvar"),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              var _checkListToAdd = ICheckList(
                description: _descriptionController.text,
                observations: _observationsController.text,
                payAtention: _payAtentionController.text,
                step: _stepController.text,
                percentageCompleted: 0,
              );
              await _checkListController.insert(_checkListToAdd);
              await _checkListController.getCheckLists();
              Modular.to.pop();
            }
          },
        ),
      ],
    );
  }
}
