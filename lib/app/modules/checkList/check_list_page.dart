import 'package:constructionChecker/app/modules/checkList/widgets/add_check_list_dialog.dart';
import 'package:constructionChecker/app/modules/checkList/widgets/check_list_item.dart';
import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/models/check_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'check_list_controller.dart';

class CheckListPage extends StatefulWidget {
  final String title;
  const CheckListPage({Key key, this.title = "CheckList"}) : super(key: key);

  @override
  _CheckListPageState createState() => _CheckListPageState();
}

class _CheckListPageState
    extends ModularState<CheckListPage, CheckListController> {
  //use 'controller' variable to access controller
  final _checkListController = Modular.get<CheckListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coisas para Verificar"),
      ),
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
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Modular.to.pop(),
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
}
