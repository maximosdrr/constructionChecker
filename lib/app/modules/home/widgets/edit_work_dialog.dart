import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditWorkDialog extends StatefulWidget {
  final IWork workToEdit;
  const EditWorkDialog({Key key, @required this.workToEdit}) : super(key: key);

  @override
  _EditWorkDialogState createState() => _EditWorkDialogState();
}

class _EditWorkDialogState extends State<EditWorkDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clientController = TextEditingController();
  final _constructionAreaController = TextEditingController();
  final _artNumberController = TextEditingController();
  final _homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.workToEdit.name;
    _clientController.text = widget.workToEdit.client;
    _constructionAreaController.text = widget.workToEdit.constructionArea;
    _artNumberController.text = widget.workToEdit.artNumber;
    return AlertDialog(
      title: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Adicionar Trabalho"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      titlePadding: EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                hintText: 'Nome do Serviço',
                controller: _nameController,
                validator: (String value) {
                  if (value.length < 3) {
                    return 'O campo deve conter 3 caracteres';
                  }

                  return null;
                },
              ),
              AppTextField(
                  hintText: 'Cliente',
                  controller: _clientController,
                  validator: (String value) {
                    if (value.length < 3) {
                      return 'O campo deve conter 3 caracteres';
                    }

                    return null;
                  }),
              AppTextField(
                  hintText: 'Área de Construção',
                  controller: _constructionAreaController,
                  validator: (String value) {
                    if (value.length < 3) {
                      return 'O campo deve conter 3 caracteres';
                    }

                    return null;
                  }),
              AppTextField(
                  hintText: 'Número ART',
                  controller: _artNumberController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'O campo deve ser preenchido';
                    }

                    return null;
                  }),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text("Salvar"),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              IWork _editedWork = IWork(
                id: widget.workToEdit.id,
                name: _nameController.text,
                client: _clientController.text,
                constructionArea: _constructionAreaController.text,
                artNumber: _artNumberController.text,
              );

              var date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (date != null) {
                _editedWork.initDate = date;
                await _homeController.editWork(_editedWork);
                await _homeController.getWorks();
                Modular.navigator.pop();
              }
            }
          },
        ),
      ],
    );
  }
}
