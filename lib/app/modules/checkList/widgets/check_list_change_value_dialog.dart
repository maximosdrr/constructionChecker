import 'package:constructionChecker/app/modules/checkList/check_list_controller.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CheckListChangeValueDialog extends StatefulWidget {
  final ICheckList checkList;
  CheckListChangeValueDialog({
    Key key,
    @required this.checkList,
  }) : super(key: key);

  @override
  _CheckListChangeValueDialogState createState() =>
      _CheckListChangeValueDialogState();
}

class _CheckListChangeValueDialogState
    extends State<CheckListChangeValueDialog> {
  final _checkListController = Modular.get<CheckListController>();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          child: AlertDialog(
            titlePadding: EdgeInsets.all(0),
            title: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Progresso"),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Alterando o seu progresso",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.checkList.percentageCompleted.toInt()}%",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ),
                Container(
                  child: Slider(
                    max: 100,
                    min: 0,
                    value: widget.checkList.percentageCompleted.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        widget.checkList.percentageCompleted = value.toInt();
                      });
                    },
                  ),
                )
              ],
            ),
            actions: [
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () => Modular.to.pop(),
              ),
              FlatButton(
                child: Text("Salvar"),
                onPressed: () async {
                  await _checkListController.update(widget.checkList);
                  await _checkListController.getCheckLists();
                  Modular.to.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
