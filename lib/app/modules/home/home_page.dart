import 'package:constructionChecker/app/modules/home/widgets/add_work_dialog.dart';
import 'package:constructionChecker/app/modules/home/widgets/work_item.dart';
import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/utils/app_colors.dart';
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: HexColor.fromHex(AppThemeData.mainColor),
              ),
              accountName: Text(
                "Bem-vindo",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              accountEmail: Text(
                "Jhonatan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "J",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Pagina Principal"),
              subtitle: Text("Seus Trabalhos"),
              trailing: Icon(Icons.home),
              onTap: () {
                Modular.to.pushNamed('/');
              },
            ),
            ListTile(
              title: Text("Pilares"),
              subtitle: Text("Veja os Pilares"),
              trailing: Icon(Icons.account_balance),
              onTap: () {
                Modular.to.pushNamed('/corner_stone');
              },
            ),
            ListTile(
              title: Text("Relatorios"),
              subtitle: Text("Gerar Relatorio"),
              trailing: Icon(Icons.article),
              onTap: () {
                debugPrint('TAP');
                // Modular.to.pushNamed('/reports');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Seu trabalhos"),
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
