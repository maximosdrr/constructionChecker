import 'package:constructionChecker/app/modules/corner_stone_history/widgets/add_corner_stone_dialog.dart';
import 'package:constructionChecker/app/modules/corner_stone_history/widgets/corner_stone_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'corner_stone_history_controller.dart';

class CornerStoneHistoryPage extends StatefulWidget {
  const CornerStoneHistoryPage({Key key}) : super(key: key);

  @override
  _CornerStoneHistoryPageState createState() => _CornerStoneHistoryPageState();
}

class _CornerStoneHistoryPageState
    extends ModularState<CornerStoneHistoryPage, CornerStoneHistoryController> {
  final _controller = Modular.get<CornerStoneHistoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historico de Notas"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (_controller.workCornerStones.status == FutureStatus.pending ||
              _controller.workCornerStones.status == FutureStatus.rejected) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_controller.workCornerStones.value.length == 0) {
            return Center(
              child: Text(
                "Nenhuma nota adicionada ainda",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: _controller.workCornerStones.value.length,
            itemBuilder: (_, i) => CornerStoneHistoryItem(
              cornerStone: _controller.workCornerStones.value[i],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddCornerStoneHistoryDialog(),
        ),
      ),
    );
  }
}
