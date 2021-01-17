import 'package:constructionChecker/models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reports_controller.dart';

class ReportsPage extends StatefulWidget {
  final String title;
  const ReportsPage({Key key, this.title = "Reports"}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends ModularState<ReportsPage, ReportsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            if (!controller.generated) {
              return Center(
                child: Text("O pdf não foi gerado"),
              );
            }
            return Center(
              child: Text("O pdf foi gerado"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var report = IReport(
            obra: 'CA.MUNOZ',
            data: DateTime.now(),
            materiaisRecebidos: ['Cimento', 'Madeira'],
            numeroContrato: '356622',
            numeroRdo: '213124',
            prazoVencer: '356',
            local: 'AQUI',
            condicao: 'PRATICAVEL',
            contratante: 'JOSE',
            prazoDecorrido: '123',
            prazoContratual: '365',
            clima: 'ENSOLARADO',
            comentarios: ['Comentario A', 'Comentario B', 'Comentario C'],
            observacoes: ['OBSERVAÇÃO A, OBSERVAÇÃO B, OBSERVACAÇÃO C'],
          );
          await controller.generatePdf(report);
        },
      ),
    );
  }
}
