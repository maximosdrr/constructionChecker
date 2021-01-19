import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FotoAdicionadaItem extends StatelessWidget {
  const FotoAdicionadaItem({Key key, this.fotoAdicionada, this.index})
      : super(key: key);
  final FotoAdicionada fotoAdicionada;
  final int index;

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    return Container(
      padding: EdgeInsets.all(20),
      color: HexColor.fromHex('#ffeeed'),
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            child: Image.file(
              this.fotoAdicionada.imagem,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.topLeft,
            child: Text(
              fotoAdicionada.descricao,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: FlatButton(
              color: Colors.red,
              child: Text(
                "Deletar",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _controller.imagensAdicionadas.removeAt(index);
              },
            ),
          )
        ],
      ),
    );
  }
}
