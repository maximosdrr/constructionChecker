import 'package:constructionChecker/extensions/hex_to_color.dart';
import 'package:flutter/cupertino.dart';

class AppThemeData {
  static String mainColor = '#3234a8';
  static String secondaryColor = '#d46d19';
  static String gradientColor1 = '#396afc';
  static String gradientColor2 = '#2948ff';
  static String cardColor1 = '#03a1fc';
  static String cardColor2 = '#7a08cc';
  static String cardColor3 = '#08cc9e';
  static String cardColor4 = '#db5c2e';

  static LinearGradient linearGradient = LinearGradient(colors: [
    HexColor.fromHex(gradientColor1),
    HexColor.fromHex(gradientColor2),
  ]);
}
