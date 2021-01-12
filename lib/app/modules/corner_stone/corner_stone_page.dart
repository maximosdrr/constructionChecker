import 'package:constructionChecker/app/modules/corner_stone/widgets/add_corner_stone_dialog.dart';
import 'package:constructionChecker/app/modules/corner_stone/widgets/corner_stone_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'corner_stone_controller.dart';

class CornerStonePage extends StatefulWidget {
  const CornerStonePage({Key key}) : super(key: key);

  @override
  _CornerStonePageState createState() => _CornerStonePageState();
}

class _CornerStonePageState
    extends ModularState<CornerStonePage, CornerStoneController> {
  //use 'controller' variable to access controller
  final _cornerStoneController = Modular.get<CornerStoneController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilares"),
      ),
      body: Observer(
        builder: (_) {
          if (_cornerStoneController.cornerStones.status ==
                  FutureStatus.pending ||
              _cornerStoneController.cornerStones.status ==
                  FutureStatus.rejected) {
            return Center(child: CircularProgressIndicator());
          }

          if (_cornerStoneController.cornerStones.value.length == 0) {
            return Center(
              child: Text(
                "Você ainda não adicionou nenhum pilar",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: _cornerStoneController.cornerStones.value.length,
            itemBuilder: (_, i) => CornerStoneItem(
              cornerStone: _cornerStoneController.cornerStones.value[i],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddCornerStoneDialog(),
        ),
      ),
    );
  }
}
