import 'package:flutter/widgets.dart';

class C {
  static Color primary = const Color.fromARGB(255, 99, 228, 189);
  static Color primaryDarker = Color.fromARGB(255, 57, 210, 164);
  static Color primaryLighter = Color.fromARGB(255, 155, 227, 205);
  static Color secondaryDarker = const Color.fromARGB(255, 255, 232, 206);
  static Color secondary = const Color(0xFFFFEEDB);
  static Color secondaryLight = const Color.fromARGB(255, 255, 246, 235);
  static Color secondaryLighter = const Color.fromARGB(255, 255, 250, 245);
  static Color tertiary = const Color(0xFFF05365);
  static Color fourth = const Color(0xFF426B69);
  static Color fifth = const Color(0xFF7A9CC6);

  static String appName = "Eventful";
  static String appNameF = "EVENT";
  static String appNameL = "FUL";
  static String appTitle = "Eventful";

  static BorderRadius borderradiusone = BorderRadius.circular(12);
  static BorderRadius borderradiustwo = BorderRadius.circular(36);

  static String serverAddress = "https://eventful1.herokuapp.com";
}

extension SpacedWith on List<Widget> {
  List<Widget> spacedWith(Widget wi) {
    return expand((e) sync* {
      yield e;
      yield wi;
    }).toList().sublist(0, (length * 2 - 1).clamp(0, double.infinity).toInt());
  }
}
