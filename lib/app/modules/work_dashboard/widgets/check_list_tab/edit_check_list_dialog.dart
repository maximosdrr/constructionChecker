import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditCheckListDialog extends StatelessWidget {
  EditCheckListDialog({Key key, @required this.checkList}) : super(key: key);
  final ICheckList checkList;
  final _descriptionController = TextEditingController();
  final _payAtentionController = TextEditingController();
  final _stepController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _workDashboardController = Modular.get<WorkDashboardController>();

  @override
  Widget build(BuildContext context) {
    _descriptionController.text = checkList.description;
    _payAtentionController.text = checkList.payAtention;
    _stepController.text = checkList.step;
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
                id: checkList.id,
                description: _descriptionController.text,
                payAtention: _payAtentionController.text,
                step: _stepController.text,
                percentageCompleted: checkList.percentageCompleted,
              );
              await _workDashboardController.updateCheckList(_checkListToAdd);
              await _workDashboardController.getCheckLists();
              Modular.to.pop();
            }
          },
        ),
      ],
    );
  }
}
