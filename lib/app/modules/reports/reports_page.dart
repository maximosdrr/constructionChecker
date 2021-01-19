import 'dart:io';

import 'package:constructionChecker/models/report.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:constructionChecker/widgets/dropdown-form-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'reports_controller.dart';

class ReportsPage extends StatefulWidget {
  final String title;
  const ReportsPage({Key key, this.title = "Reports"}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends ModularState<ReportsPage, ReportsController> {
  final _controller = Modular.get<ReportsController>();
  Future<File> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    File image;

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('Nenhuma imagem selecionada');
    }

    return image;
  }

  String _clima = '';
  String _condicao = '';

  final _obraController = TextEditingController();
  final _numeroContratoController = TextEditingController();
  final _numeroRdoController = TextEditingController();
  final _contratanteController = TextEditingController();
  final _localController = TextEditingController();
  final _prazoContratualController = TextEditingController();
  final _prazoDecorridoController = TextEditingController();
  final _prazoAVencerController = TextEditingController();
  final _comentariosController = TextEditingController();
  final _observacoesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextField(
                hintText: 'Obra',
                controller: _obraController,
              ),
              AppTextField(
                hintText: 'Numero do Contrato',
                controller: _numeroContratoController,
              ),
              AppTextField(
                hintText: 'Numero RDO',
                controller: _numeroRdoController,
              ),
              AppTextField(
                hintText: 'Contratante',
                controller: _contratanteController,
              ),
              AppTextField(
                hintText: 'Local',
                controller: _localController,
              ),
              AppTextField(
                hintText: 'Prazo Contratual',
                controller: _prazoContratualController,
              ),
              AppTextField(
                hintText: 'Prazo Decorrido',
                controller: _prazoDecorridoController,
              ),
              AppTextField(
                hintText: 'Prazo a Vencer',
                controller: _prazoAVencerController,
              ),
              AppTextField(
                hintText: 'Comentarios',
                controller: _comentariosController,
              ),
              AppTextField(
                hintText: 'Observações',
                controller: _observacoesController,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: DropDownFormField(
                  hintText: 'Clima',
                  value: _clima,
                  onSaved: (value) {
                    setState(() {
                      _clima = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _clima = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Claro",
                      "value": "Claro",
                    },
                    {
                      "display": "Nublado",
                      "value": "Nublado",
                    },
                    {
                      "display": "Chuvoso",
                      "value": "Chuvoso",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: DropDownFormField(
                  hintText: 'Condição',
                  value: _condicao,
                  onSaved: (value) {
                    setState(() {
                      _condicao = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _condicao = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Praticável",
                      "value": "Praticável",
                    },
                    {
                      "display": "Impraticavel",
                      "value": "Impraticavel",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () async {
          _controller.reportToPrint.clima = _clima;
          _controller.reportToPrint.comentarios = _comentariosController.text;
          _controller.reportToPrint.condicao = _condicao;
          _controller.reportToPrint.contratante = _contratanteController.text;
          _controller.reportToPrint.local = _localController.text;
          _controller.reportToPrint.numeroContrato =
              _numeroContratoController.text;
          _controller.reportToPrint.numeroRdo = _numeroRdoController.text;
          _controller.reportToPrint.obra = _obraController.text;
          _controller.reportToPrint.observacoes = _observacoesController.text;
          _controller.reportToPrint.prazoContratual =
              _prazoContratualController.text;
          _controller.reportToPrint.prazoDecorrido =
              _prazoDecorridoController.text;
          _controller.reportToPrint.prazoVencer = _prazoAVencerController.text;

          await Modular.to.pushNamed('/reports/fase1');
        },
      ),
    );
  }
}
