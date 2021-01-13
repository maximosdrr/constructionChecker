import 'package:constructionChecker/app/modules/work_dashboard/widgets/corner_stone/corner_stone_item.dart';
import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class CornerStoneTab extends StatelessWidget {
  CornerStoneTab({Key key}) : super(key: key);

  final _controller = Modular.get<WorkDashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (_controller.cornerStonesAvg.status == FutureStatus.pending ||
              _controller.cornerStonesAvg.status == FutureStatus.rejected) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_controller.cornerStonesAvg.value.length == 0) {
            return Center(
              child: Text(
                "Sem Notas no Momento",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: _controller.cornerStonesAvg.value.length,
            itemBuilder: (_, i) {
              return Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: CornerStoneAVGItem(
                  cornerStoneAvg: _controller.cornerStonesAvg.value[i],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
