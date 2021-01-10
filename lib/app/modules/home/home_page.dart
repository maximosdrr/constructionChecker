import 'package:constructionChecker/app/modules/home/widgets/add_work_dialog.dart';
import 'package:constructionChecker/app/modules/home/widgets/work_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final _homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seu trabalhos"),
        leading: Icon(Icons.work),
      ),
      body: Observer(
        builder: (_) {
          if (_homeController.works.status == FutureStatus.pending ||
              _homeController.works.status == FutureStatus.rejected) {
            return Center(child: CircularProgressIndicator());
          }

          if (_homeController.works.value.length == 0) {
            return Center(
              child: Text(
                "Sem trabalhos no momento",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: _homeController.works.value.length,
            itemBuilder: (_, i) => WorkItem(
              work: _homeController.works.value[i],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          return await showDialog(
            context: context,
            builder: (context) => AddWorkDialog(),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 45,
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
