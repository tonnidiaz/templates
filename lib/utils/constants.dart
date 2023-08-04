import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frust/utils/functions.dart';
import 'package:frust/views/about.dart';
import '/views/home.dart';

class Page {
  Widget widget;
  bool inList;
  bool isAction;
  String name;
  IconData? icon;
  Page(this.name, this.widget,
      {this.icon, this.inList = true, this.isAction = false});
}

final List<Page> pages = [
  Page(
    "/",
    const HomePage(),
    icon: CupertinoIcons.home,
  ),
  Page("/about", const AboutPage(),
      icon: CupertinoIcons.info_circle, isAction: true),
];

const String tag = "Tunedbass";
const String package = "com.tb.tmeta";
const double bottomSheetH = 150;
const double bottomBarH = 45;
const double sidebarW = 45;
const double iconSize = 25;
const double splashRadius = iconSize;

const Color titlebarBG = Color.fromRGBO(66, 66, 66, 1);
const Color appBG = Color.fromRGBO(48, 48, 48, 1);
const Color bg0 = Color.fromRGBO(46, 46, 46, 1);
const Color bg1 = Color.fromRGBO(56, 56, 56, 1);
const Color btnBG = Color.fromRGBO(45, 45, 45, 1);
final bool isMobile = Platform.isAndroid || Platform.isIOS;
const defaultPadding = EdgeInsets.all(8);
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

final defaultMenu = [
  MenuItemButton(
    onPressed: () {
      clog("Open clicked");
    },
    shortcut: const SingleActivator(LogicalKeyboardKey.keyO, control: true),
    child: const Text("Open"),
  ),
  MenuItemButton(
    onPressed: () {
      clog("Open clicked");
    },
    shortcut: const SingleActivator(LogicalKeyboardKey.keyS, control: true),
    child: const Text("Save"),
  ),
];
