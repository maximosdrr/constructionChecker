import 'dart:io';

import 'package:constructionChecker/app/modules/work_dashboard/widgets/check_list_tab/add_check_list_dialog.dart';
import 'package:constructionChecker/app/modules/work_dashboard/widgets/check_list_tab/check_list_item.dart';
import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

class CheckListTab extends StatefulWidget {
  const CheckListTab({Key key}) : super(key: key);

  @override
  _CheckListTabState createState() => _CheckListTabState();
}

class _CheckListTabState
    extends ModularState<CheckListTab, WorkDashboardController> {
  //use 'controller' variable to access controller
  final _checkListController = Modular.get<WorkDashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (_checkListController.checkLists.status == FutureStatus.pending ||
            _checkListController.checkLists.status == FutureStatus.rejected) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_checkListController.checkLists.value.length == 0) {
          return Center(
            child: Text(
              "Nada a checar no momento",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: _checkListController.checkLists.value.length,
          itemBuilder: (_, i) => CheckListItem(
            checkList: _checkListController.checkLists.value[i],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddCheckListDialog(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 45,
              child: FlatButton.icon(
                label: Text(
                  'Gerar Relatorio',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.white,
                ),
                onPressed: () async {
                  try {
                    var logoFile = await pickLogoFile();
                    if (logoFile != null) {
                      await _checkListController
                          .generateProgressionReport(logoFile);
                      FlushbarHelper.createSuccess(
                        message: 'Seu relatorio foi salvo na pasta downloads',
                      ).show(context);
                    }
                  } catch (e) {
                    print(e);
                    FlushbarHelper.createError(
                            message: 'Não foi possivel gerar o relatorio')
                        .show(context);
                  }
                },
              ),
            ),
            Container(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }

  pickLogoFile() async {
    File _image;
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      return _image;
    }
    return null;
  }
}
