import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/app/modules/reports/widgets/fotos_adicionadas/add_foto_dialog.dart';
import 'package:constructionChecker/app/modules/reports/widgets/fotos_adicionadas/foto_adicionada_item.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReportPashe2 extends StatefulWidget {
  ReportPashe2({Key key}) : super(key: key);

  @override
  _ReportPashe2State createState() => _ReportPashe2State();
}

class _ReportPashe2State extends State<ReportPashe2> {
  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Text(
              "Finalizar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              await _controller.finish();
              if (_controller.generated) {
                FlushbarHelper.createSuccess(
                        message: 'O Relatorio foi Gerado com Sucesso')
                    .show(context);
              } else {
                FlushbarHelper.createError(
                        message: 'Algo deu errado, tente mais tarde')
                    .show(context);
              }
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _controller.imagensAdicionadas.length,
            itemBuilder: (_, i) {
              return FotoAdicionadaItem(
                fotoAdicionada: _controller.imagensAdicionadas[i],
                index: i,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddFotoAdicionadaDialog(),
        ),
      ),
    );
  }
}
