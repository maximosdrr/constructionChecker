import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleteWorkDialog extends StatelessWidget {
  final workId;
  DeleteWorkDialog({Key key, @required this.workId}) : super(key: key);
  final _homeController = Modular.get<HomeController>();
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
            await _homeController.deleteWork(workId);
            await _homeController.getWorks();
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
