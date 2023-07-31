import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:frust/views/about.dart';
import '/views/home.dart';

const String tag = "Tunedbass";
const List<Widget> pages = [HomePage(), AboutPage()];
const String package = "com.tb.tmeta";
const double bottomSheetH = 150;
const double bottomBarH = 45;
const double iconSize = 25;
const double splashRadius = iconSize;
const List<String> formats = ["mp3", "wav", "ogg", "aac"];
const Color titlebarBG = Color.fromRGBO(66, 66, 66, 1);
const Color btnBG = Color.fromRGBO(40, 40, 40, 1);
final bool isMobile = Platform.isAndroid || Platform.isIOS;

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
