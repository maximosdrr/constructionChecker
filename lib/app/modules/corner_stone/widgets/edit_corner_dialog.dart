import 'package:constructionChecker/app/modules/corner_stone/corner_stone_controller.dart';
import 'package:constructionChecker/models/cornerstone.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditCornerStoneDialog extends StatelessWidget {
  final ICornerStone cornerStone;
  EditCornerStoneDialog({Key key, @required this.cornerStone})
      : super(key: key);
  final _nameController = TextEditingController();
  final _cornerStoneController = Modular.get<CornerStoneController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _nameController.text = cornerStone.name;
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        title: Text("Editar Pilar"),
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
              ICornerStone _cornerStoneToUpdate = ICornerStone(
                id: cornerStone.id,
                name: _nameController.text,
              );

              await _cornerStoneController
                  .updateCornerStone(_cornerStoneToUpdate);
              await _cornerStoneController.getCornerStones();
              Modular.to.pop();
            }
          },
        ),
      ],
    );
  }
}
