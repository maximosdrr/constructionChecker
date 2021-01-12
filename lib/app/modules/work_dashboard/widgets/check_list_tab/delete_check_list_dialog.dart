import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleteCheckListDialog extends StatelessWidget {
  final id;
  DeleteCheckListDialog({Key key, @required this.id}) : super(key: key);
  final _workDashboardController = Modular.get<WorkDashboardController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        title: Text("Apagando Item"),
        automaticallyImplyLeading: false,
      ),
      content: Text("Deseja mesmo apagar esse item ?"),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Modular.to.pop(),
        ),
        FlatButton(
          child: Text("Apagar"),
          onPressed: () async {
            await _workDashboardController.deleteCheckList(id);
            await _workDashboardController.getCheckLists();
            Modular.to.pop();
          },
        ),
      ],
    );
  }
}
