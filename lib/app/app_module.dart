import 'package:constructionChecker/app/modules/corner_stone/corner_stone_controller.dart';
import 'package:constructionChecker/app/modules/corner_stone/corner_stone_module.dart';
import 'package:constructionChecker/app/modules/corner_stone_history/corner_stone_history_module.dart';
import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_controller.dart';
import 'package:constructionChecker/app/modules/work_dashboard/work_dashboard_module.dart';
import 'package:constructionChecker/repositories/check_list/check_list_repo.dart';
import 'package:constructionChecker/repositories/corner_stone/corner_stone_repo.dart';
import 'package:constructionChecker/repositories/work/work_repo.dart';
import 'package:constructionChecker/repositories/work_corner_stone/work_corner_stone_repo.dart';
import 'package:constructionChecker/services/check_list/check_list_service.dart';
import 'package:constructionChecker/services/corner_stone/corner_stone_service.dart';
import 'package:constructionChecker/services/work/work_service.dart';
import 'package:constructionChecker/services/work_corner_stone/work_corner_stone_service.dart';
import 'package:sqflite/sqflite.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:constructionChecker/app/app_widget.dart';
import 'package:constructionChecker/app/modules/home/home_module.dart';

import 'modules/corner_stone_history/corner_stone_history_controller.dart';

class AppModule extends MainModule {
  Database database;
  AppModule(this.database);
  @override
  List<Bind> get binds => [
        Bind((i) => database),
        //REPOSITORIES
        Bind((i) => WorkRepository(i.get())),
        Bind((i) => CheckListRepo(i.get())),
        Bind((i) => CornerStoneRepo(i.get())),
        Bind((i) => WorkCornerStoneRepo(i.get())),
        //SERVICES
        Bind((i) => WorkService(i.get(), i.get())),
        Bind((i) => CheckListService(i.get())),
        Bind((i) => CornerStoneService(i.get())),
        Bind((i) => WorkCornerStoneService(i.get(), i.get())),

        //CONTROLLERS
        Bind((i) => HomeController(i.get())),

        Bind(
            (i) => WorkDashboardController(i.get(), i.get(), i.get(), i.get())),

        Bind((i) => CornerStoneController(i.get())),
        Bind((i) => CornerStoneHistoryController(i.get())),
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/work_dashboard', module: WorkDashboardModule()),
        ModularRouter('/corner_stone', module: CornerStoneModule()),
        ModularRouter('/corner_stone_history',
            module: CornerStoneHistoryModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
