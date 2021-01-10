import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: MainTheme.theme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
