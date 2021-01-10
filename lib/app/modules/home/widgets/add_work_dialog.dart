import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddWorkDialog extends StatefulWidget {
  // final HomeController homeController;
  const AddWorkDialog({
    Key key,
    // this.homeController,
  }) : super(key: key);

  @override
  _AddWorkDialogState createState() => _AddWorkDialogState();
}

class _AddWorkDialogState extends State<AddWorkDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clientController = TextEditingController();
  final _constructionAreaController = TextEditingController();
  final _artNumberController = TextEditingController();
  final _homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
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
          child: Text("Adicionar"),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              IWork _workToAdd = IWork(
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
                _workToAdd.initDate = date;
                await _homeController.insert(_workToAdd);
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
