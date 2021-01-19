import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StatusItem extends StatelessWidget {
  final Status status;
  final int index;
  const StatusItem({Key key, this.status, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    return Container(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(
            status.description,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Andar: ${status.andar}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Executado: ${status.porcentagemDeExecucao} %",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Status: ${status.status}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              _controller.status.removeAt(index);
            },
          ),
        ),
      ),
    );
  }
}
