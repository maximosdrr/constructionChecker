import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/models/report.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class AddMaoDeObraDialog extends StatelessWidget {
  AddMaoDeObraDialog({Key key}) : super(key: key);

  double selectedValue = 0;
  final _descricaoController = TextEditingController();
  final _categoriaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();

    return AlertDialog(
      title: AppBar(
        title: Text("Adicionar Mão de Obra"),
        automaticallyImplyLeading: false,
      ),
      titlePadding: EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: AppTextField(
                hintText: 'Descrição',
                controller: _descricaoController,
              ),
            ),
            Container(
              child: AppTextField(
                hintText: 'Categoria',
                controller: _categoriaController,
              ),
            ),
            Container(
              child: SpinBox(
                min: 0,
                max: 5,
                value: 0,
                decimals: 1,
                step: 1,
                onChanged: (value) {
                  selectedValue = value;
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () => Modular.to.pop(),
          child: Text("Cancelar"),
        ),
        FlatButton(
          onPressed: () {
            _controller.maoDeObra.add(
              MaoDeObra(
                categoria: _categoriaController.text,
                descricao: _descricaoController.text,
                quantidade: selectedValue.toInt(),
              ),
            );
            Modular.to.pop();
          },
          child: Text("Adicionar"),
        )
      ],
    );
  }
}
