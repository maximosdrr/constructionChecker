import 'dart:math';

import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/models/work.dart';
import 'package:constructionChecker/utils/app_colors.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:constructionChecker/app/modules/home/widgets/delete_work_dialog.dart';
import 'package:constructionChecker/app/modules/home/widgets/edit_work_dialog.dart';

class WorkItem extends StatefulWidget {
  final IWork work;
  const WorkItem({
    Key key,
    this.work,
  }) : super(key: key);

  @override
  _WorkItemState createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem> {
  final _homeController = Modular.get<HomeController>();
  final colors = [
    AppThemeData.cardColor1,
    AppThemeData.cardColor2,
    AppThemeData.cardColor3,
    AppThemeData.cardColor4,
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        _homeController.selectedWork = widget.work;
        await Modular.to.pushNamed('work_dashboard');
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 10,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 16,
          color: HexColor.fromHex(colors[Random().nextInt(colors.length)]),
          child: Container(
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
                    "Titulo: ${widget.work.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    generateCardField(widget.work.client, 'Cliente'),
                    generateCardField(widget.work.constructionArea, 'Área: '),
                    generateCardField(widget.work.artNumber, 'ART: '),
                    generateCardField(
                        formatDate(
                            widget.work.initDate, [dd, '/', mm, '/', yyyy]),
                        'Iniciou: '),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Deletar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => DeleteWorkDialog(
                            workId: widget.work.id,
                          ),
                        ),
                      ),
                      FlatButton(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Editar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => EditWorkDialog(
                            workToEdit: widget.work,
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
