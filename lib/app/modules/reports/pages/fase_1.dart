import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:constructionChecker/app/modules/reports/widgets/mao_de_obra/add_mao_de_obra_dialog.dart';
import 'package:constructionChecker/app/modules/reports/widgets/mao_de_obra/mao_de_obra_item.dart';
import 'package:constructionChecker/app/modules/reports/widgets/materiais_recebidos/add_materia_recebido_dialog.dart';
import 'package:constructionChecker/app/modules/reports/widgets/materiais_recebidos/material_recebido_item.dart';
import 'package:constructionChecker/app/modules/reports/widgets/status/add_status.dart';
import 'package:constructionChecker/app/modules/reports/widgets/status/status_item.dart';
import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/utils/app_colors.dart';
import 'package:constructionChecker/widgets/app-text-field/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReportPashe1 extends StatelessWidget {
  ReportPashe1({Key key}) : super(key: key);

  final _controller = Modular.get<ReportsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _areaDaMaoDeObra(context),
            _areaDoStatus(context),
            _areaDosMateriaisRecebidos(context),
            Container(
              margin: EdgeInsets.only(
                bottom: 30,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () => Modular.to.pushNamed('/reports/fase2'),
      ),
    );
  }

  _areaDosMateriaisRecebidos(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 30),
          alignment: Alignment.topLeft,
          child: Text(
            "Materiais Recebidos",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Observer(
          builder: (_) {
            return Container(
              margin: EdgeInsets.only(top: 10, right: 30, left: 30),
              color: HexColor.fromHex('#ffeeed'),
              height: 300,
              child: ListView.builder(
                itemCount: _controller.materiaisRecebidos.length,
                itemBuilder: (_, i) => MaterialRecebidoItem(
                  value: _controller.materiaisRecebidos[i],
                  index: i,
                ),
              ),
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 10, right: 30),
          alignment: Alignment.topRight,
          child: FlatButton(
            color: HexColor.fromHex(AppThemeData.mainColor),
            child: Text(
              "Adicionar",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AddMaterialRecebidoDialog(),
            ),
          ),
        ),
      ],
    );
  }

  _areaDoStatus(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 30),
          alignment: Alignment.topLeft,
          child: Text(
            "Andamento do Serviço",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Observer(
          builder: (_) {
            return Container(
              margin: EdgeInsets.only(top: 10, right: 30, left: 30),
              color: HexColor.fromHex('#ffeeed'),
              height: 300,
              child: ListView.builder(
                itemCount: _controller.status.length,
                itemBuilder: (_, i) => StatusItem(
                  status: _controller.status[i],
                  index: i,
                ),
              ),
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10,
            right: 30,
          ),
          alignment: Alignment.topRight,
          child: FlatButton(
            color: HexColor.fromHex(AppThemeData.mainColor),
            child: Text(
              "Adicionar",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AddStatusDialog(),
            ),
          ),
        ),
      ],
    );
  }

  _areaDaMaoDeObra(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 30),
          alignment: Alignment.topLeft,
          child: Text(
            "Mão de Obra",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Observer(
          builder: (_) {
            return Container(
              margin: EdgeInsets.only(top: 10, right: 30, left: 30),
              color: HexColor.fromHex('#ffeeed'),
              height: 300,
              child: ListView.builder(
                itemCount: _controller.maoDeObra.length,
                itemBuilder: (_, i) => MaoDeObraItem(
                  maoDeObra: _controller.maoDeObra[i],
                  index: i,
                ),
              ),
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10,
            right: 30,
          ),
          alignment: Alignment.topRight,
          child: FlatButton(
            color: HexColor.fromHex(AppThemeData.mainColor),
            child: Text(
              "Adicionar",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AddMaoDeObraDialog(),
            ),
          ),
        )
      ],
    );
  }
}
