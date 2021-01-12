import 'package:constructionChecker/app/modules/corner_stone/corner_stone_controller.dart';
import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleteCornerStoneDialog extends StatelessWidget {
  final cornerStoneId;
  DeleteCornerStoneDialog({Key key, @required this.cornerStoneId})
      : super(key: key);
  final _cornerStoneController = Modular.get<CornerStoneController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Deletando Trabalho"),
      ),
      content: Text("Deseja realmente deletar esse trabalho ?"),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancelar"),
        ),
        FlatButton(
          onPressed: () async {
            await _cornerStoneController.deleteCornerStone(cornerStoneId);
            await _cornerStoneController.getCornerStones();
            Modular.to.pop();
          },
          child: Text(
            "Deletar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
