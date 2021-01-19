import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddMaterialRecebidoDialog extends StatelessWidget {
  const AddMaterialRecebidoDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    final _materialController = TextEditingController();
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Adicionar"),
      ),
      content: AppTextField(
        hintText: 'Nome do Material',
        controller: _materialController,
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Modular.to.pop(),
        ),
        FlatButton(
          child: Text("Adicionar"),
          onPressed: () {
            _controller.materiaisRecebidos.add(_materialController.text);
            Modular.to.pop();
          },
        )
      ],
    );
  }
}
