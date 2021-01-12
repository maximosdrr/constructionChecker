import 'package:constructionChecker/app/modules/corner_stone/corner_stone_controller.dart';
import 'package:constructionChecker/models/cornerstone.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddCornerStoneDialog extends StatelessWidget {
  AddCornerStoneDialog({Key key}) : super(key: key);
  final _nameController = TextEditingController();
  final _cornerStoneController = Modular.get<CornerStoneController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        title: Text("Adicionar Pilar"),
        automaticallyImplyLeading: false,
      ),
      content: Form(
        key: _formKey,
        child: AppTextField(
          hintText: 'Nome do Pilar',
          controller: _nameController,
          validator: (String value) {
            if (value.isEmpty) {
              return 'O campo precisa ser preenchido';
            }

            if (value.length < 3) {
              return 'O campo precisa conter ao menos 3 caracteres';
            }

            return null;
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
            if (_formKey.currentState.validate()) {
              ICornerStone _cornerStoneToAdd = ICornerStone(
                name: _nameController.text,
              );

              await _cornerStoneController.insertCornerStone(_cornerStoneToAdd);
              await _cornerStoneController.getCornerStones();
              Modular.to.pop();
            }
          },
        ),
      ],
    );
  }
}
