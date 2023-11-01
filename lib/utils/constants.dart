import 'package:flutter/cupertino.dart';
import 'package:tuned/views/about.dart';
import 'package:tu/tu.dart';
import '/views/home.dart';

final List<TuPage> pages = [
  TuPage(
    "/",
    const HomePage(),
    icon: CupertinoIcons.home,
  ),
  TuPage("/about", const AboutPage(),
      icon: CupertinoIcons.info_circle, isAction: true),
];
