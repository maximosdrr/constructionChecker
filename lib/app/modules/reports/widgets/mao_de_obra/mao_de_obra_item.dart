import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MaoDeObraItem extends StatelessWidget {
  final MaoDeObra maoDeObra;
  final int index;
  const MaoDeObraItem({Key key, this.maoDeObra, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(
          "Descrição: ${maoDeObra.descricao}",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categoria: ${maoDeObra.categoria}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Quantidade: ${maoDeObra.quantidade}",
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
            _controller.maoDeObra.removeAt(index);
          },
        ),
      ),
    );
  }
}
