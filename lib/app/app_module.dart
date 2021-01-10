import 'package:constructionChecker/app/modules/checkList/check_list_controller.dart';
import 'package:constructionChecker/app/modules/checkList/check_list_module.dart';
import 'package:constructionChecker/app/modules/home/home_controller.dart';
import 'package:constructionChecker/repositories/check_list/check_list_repo.dart';
import 'package:constructionChecker/repositories/work/work_repo.dart';
import 'package:sqflite/sqflite.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:constructionChecker/app/app_widget.dart';
import 'package:constructionChecker/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  Database database;
  AppModule(this.database);
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => database),
        //REPOSITORIES
        Bind((i) => WorkRepository(i.get())),
        Bind((i) => CheckListRepo(i.get())),
        //CONTROLLERS
        Bind((i) => HomeController(i.get())),
        Bind((i) => CheckListController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/check_list', module: CheckListModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
