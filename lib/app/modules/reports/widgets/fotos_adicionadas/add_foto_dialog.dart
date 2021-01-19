import 'dart:io';

import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/models/report.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class AddFotoAdicionadaDialog extends StatelessWidget {
  const AddFotoAdicionadaDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    final _legendaController = TextEditingController();
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        title: Text("Adicionar"),
        automaticallyImplyLeading: false,
      ),
      content: AppTextField(
        hintText: 'Legenda',
        controller: _legendaController,
      ),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Modular.to.pop(),
        ),
        FlatButton(
          child: Text("Adicionar"),
          onPressed: () async {
            var pickedFile = await getImage();
            if (pickedFile != null) {
              _controller.addPhoto(
                FotoAdicionada(
                  descricao: _legendaController.text,
                  imagem: pickedFile,
                ),
              );
              Modular.to.pop();
            }
          },
        ),
      ],
    );
  }

  Future<File> getImage() async {
    File _image;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    _image = File(pickedFile.path);
    return _image;
  }
}
