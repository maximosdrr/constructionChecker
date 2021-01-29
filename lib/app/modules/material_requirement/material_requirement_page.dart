import 'dart:io';

import 'package:constructionChecker/app/modules/material_requirement/widgets/add_material_item.dart';
import 'package:constructionChecker/app/modules/material_requirement/widgets/material_item.dart';
import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'material_requirement_controller.dart';

class MaterialRequirementPage extends StatefulWidget {
  final String title;
  const MaterialRequirementPage(
      {Key key, this.title = "Requerimento de Material"})
      : super(key: key);

  @override
  _MaterialRequirementPageState createState() =>
      _MaterialRequirementPageState();
}

class _MaterialRequirementPageState extends ModularState<
    MaterialRequirementPage, MaterialRequirementController> {
  //use 'controller' variable to access controller
  final _controller = Modular.get<MaterialRequirementController>();
  final _formKey = GlobalKey<FormState>();
  final _workNameController = TextEditingController();
  final _clientNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          FlatButton(
            child: Text(
              "Finalizar",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              try {
                if (_formKey.currentState.validate()) {
                  var logoFile = await pickLogoFile();
                  if (logoFile != null) {
                    _controller.work = _workNameController.text;
                    _controller.client = _clientNameController.text;
                    await _controller
                        .generateMaterialRequirementReport(logoFile);
                    FlushbarHelper.createSuccess(
                            message:
                                'O seu requerimento foi gerado na pasta downloads')
                        .show(context);
                  }
                }
              } catch (e) {
                FlushbarHelper.createError(
                        message: 'Algo deu errado ao gerar o pdf')
                    .show(context);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: AppTextField(
                  hintText: 'Nome da Obra',
                  controller: _workNameController,
                  validator: notNullFieldValidator,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: AppTextField(
                  hintText: 'Nome do Cliente',
                  controller: _clientNameController,
                  validator: notNullFieldValidator,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Text(
                  "Lista de Materiais",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                      color: HexColor.fromHex('#ededed'),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: _controller.materialList.length,
                      itemBuilder: (_, i) {
                        return MaterialListItem(
                          material: _controller.materialList[i],
                          index: i,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddMaterialItemDialog(),
        ),
      ),
    );
  }

  pickLogoFile() async {
    File _image;
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      return _image;
    }
    return null;
  }

  String notNullFieldValidator(String value) {
    if (value.isEmpty) {
      return 'O campo precisa ser preenchido';
    }

    return null;
  }
}
