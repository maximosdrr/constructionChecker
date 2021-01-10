import 'package:constructionChecker/app/modules/checkList/check_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleteCheckListDialog extends StatelessWidget {
  final id;
  DeleteCheckListDialog({Key key, @required this.id}) : super(key: key);
  final _checkListController = Modular.get<CheckListController>();
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
            await _checkListController.delete(id);
            await _checkListController.getCheckLists();
            Modular.to.pop();
          },
        ),
      ],
    );
  }
}
