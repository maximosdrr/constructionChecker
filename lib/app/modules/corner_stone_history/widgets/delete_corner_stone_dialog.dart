import 'package:constructionChecker/app/modules/corner_stone_history/corner_stone_history_controller.dart';
import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleterHistoryCornerStoneDialog extends StatelessWidget {
  final cornerStoneHistoryId;

  DeleterHistoryCornerStoneDialog({Key key, this.cornerStoneHistoryId})
      : super(key: key);
  final _cornerStoneHistoryController =
      Modular.get<CornerStoneHistoryController>();
  final _workDashboardController = Modular.get<WorkDashboardController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        title: Text("Apagando"),
      ),
      content: Text("Deseja realmente apagar essa nota ?"),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Modular.to.pop(),
        ),
        FlatButton(
          child: Text("Deletar"),
          onPressed: () async {
            await _cornerStoneHistoryController
                .deleteWorkCornerStone(this.cornerStoneHistoryId);
            await _workDashboardController.getWorkCornerStones();
            await _workDashboardController.getCornerStoneAvg();
            await _cornerStoneHistoryController.findManyByCornerStone();
            Modular.to.pop();
          },
        ),
      ],
    );
  }
}
