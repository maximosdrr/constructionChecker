import 'package:constructionChecker/app/modules/work_dashboard/tabs/check_list.dart';
import 'package:constructionChecker/app/modules/work_dashboard/tabs/corner_stone.dart';
import 'package:constructionChecker/app/modules/work_dashboard/tabs/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'work_dashboard_controller.dart';

class WorkDashboardPage extends StatefulWidget {
  final String title;
  const WorkDashboardPage({Key key, this.title = "WorkDashboard"})
      : super(key: key);

  @override
  _WorkDashboardPageState createState() => _WorkDashboardPageState();
}

class _WorkDashboardPageState
    extends ModularState<WorkDashboardPage, WorkDashboardController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Check List',
                icon: Icon(
                  Icons.check,
                ),
              ),
              Tab(
                text: 'Pilares',
                icon: Icon(
                  Icons.account_balance,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CheckListTab(),
            CornerStoneTab(),
          ],
        ),
      ),
    );
  }
}
