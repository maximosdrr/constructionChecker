import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/models/report.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddStatusDialog extends StatelessWidget {
  AddStatusDialog({Key key}) : super(key: key);
  double slideValue = 0;
  final _andarController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          title: AppBar(
            title: Text("Adicionar"),
            automaticallyImplyLeading: false,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                AppTextField(
                  hintText: 'Andar',
                  controller: _andarController,
                ),
                AppTextField(
                  hintText: 'Descrição',
                  controller: _descricaoController,
                ),
                AppTextField(
                  hintText: 'Status',
                  controller: _statusController,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Execução ${slideValue.toInt()} %",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Slider(
                        value: slideValue,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            slideValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () => Modular.to.pop(),
            ),
            FlatButton(
              child: Text("Adicionar"),
              onPressed: () {
                _controller.status.add(
                  Status(
                      andar: _andarController.text,
                      description: _descricaoController.text,
                      porcentagemDeExecucao: slideValue.toInt(),
                      status: _statusController.text),
                );

                Modular.to.pop();
              },
            )
          ],
        );
      },
    );
  }
}
