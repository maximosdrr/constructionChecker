import 'package:constructionChecker/app/modules/corner_stone_history/corner_stone_history_controller.dart';
import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:constructionChecker/models/work_corner_stone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class AddCornerStoneHistoryDialog extends StatelessWidget {
  final _controller = Modular.get<CornerStoneHistoryController>();
  AddCornerStoneHistoryDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double selectedValue = 0;
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Adicionar Nota"),
      ),
      content: Container(
        child: SpinBox(
          min: 0,
          max: 5,
          value: 0,
          decimals: 1,
          step: 0.5,
          onChanged: (value) {
            selectedValue = value;
          },
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
            final _workDashboardController =
                Modular.get<WorkDashboardController>();

            var _workCornerStoneToAdd = IWorkCornerStone(
              savedAt: DateTime.now(),
              grade: selectedValue,
            );

            await _controller.insertWorkCornerstone(_workCornerStoneToAdd);
            await _controller.findManyByCornerStone();
            await _workDashboardController.getCheckLists();
            await _workDashboardController.getCornerStoneAvg();
            Modular.to.pop();
          },
        ),
      ],
    );
  }
}
