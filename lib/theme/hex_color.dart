import 'package:flutter/material.dart';

/*
Util class for hex string convertation
usage: 
Color color1 = HexColor("b74093");
Color color2 = HexColor("#b74093");
Color color3 = HexColor("#88b74093");
*/
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
