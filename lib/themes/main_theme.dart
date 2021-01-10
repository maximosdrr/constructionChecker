import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:constructionChecker/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainTheme {
  static get theme => ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          color: HexColor.fromHex(AppThemeData.mainColor),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: HexColor.fromHex(AppThemeData.mainColor),
          shape: CircularNotchedRectangle(),
        ),
      );
}
