import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/utils/constants.dart';

import 'stores/app.dart';

class MobileApp extends StatefulWidget {
  static const mChannel = MethodChannel("$package/channel");
  const MobileApp({Key? key}) : super(key: key);

  @override
  State<MobileApp> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  AppStore? appStore;
  @override
  Widget build(BuildContext context) {
    appStore ??= context.watch<AppStore>();

    Map<String, Widget Function(BuildContext)> routes = {};
    for (var page in pages) {
      routes[page.name] = (context) => page.widget;
    }
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: routes,
      initialRoute: pages.elementAt(appStore!.tab).name,
    );
  }
}
