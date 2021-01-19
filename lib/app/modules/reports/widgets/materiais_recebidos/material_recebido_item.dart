import 'package:constructionChecker/app/modules/reports/reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MaterialRecebidoItem extends StatelessWidget {
  final String value;
  final int index;
  const MaterialRecebidoItem({Key key, this.value, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<ReportsController>();
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {
                _controller.materiaisRecebidos.removeAt(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
