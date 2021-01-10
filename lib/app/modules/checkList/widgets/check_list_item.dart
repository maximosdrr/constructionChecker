import 'dart:math';

import 'package:constructionChecker/app/modules/checkList/widgets/check_list_change_value_dialog.dart';
import 'package:constructionChecker/app/modules/checkList/widgets/delete_check_list_dialog.dart';
import 'package:constructionChecker/app/modules/checkList/widgets/edit_check_list_dialog.dart';
import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:constructionChecker/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CheckListItem extends StatelessWidget {
  final ICheckList checkList;
  const CheckListItem({Key key, this.checkList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppThemeData.cardColor1,
      AppThemeData.cardColor2,
      AppThemeData.cardColor3,
      AppThemeData.cardColor4,
    ];
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          color: HexColor.fromHex(colors[Random().nextInt(colors.length)]),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  top: 15,
                  bottom: 5,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  "Descrição: ${checkList.description}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
              generateCardField(checkList.payAtention, 'Atenção'),
              generateCardField(checkList.observations, 'Observações'),
              generateCardField(checkList.step, 'Etapa'),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  top: 5,
                  left: 25,
                ),
                child: Text(
                  "Você já completou: ${checkList.percentageCompleted}%",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      child: Text(
                        "Editar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => EditCheckListDialog(
                          checkList: checkList,
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        "Apagar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => DeleteCheckListDialog(
                          id: checkList.id,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (context) => CheckListChangeValueDialog(
          checkList: checkList,
        ),
      ),
    );
  }

  Container generateCardField(String displayValue, String displayPrefix) =>
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(
          top: 5,
          left: 25,
        ),
        child: Text(
          "$displayPrefix : $displayValue",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
}
