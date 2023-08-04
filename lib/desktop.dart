import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_bar/menu_bar.dart';
import 'package:provider/provider.dart';
import '/utils/constants.dart';

import 'stores/app.dart';

class DesktopApp extends StatefulWidget {
  static const mChannel = MethodChannel("$package/channel");
  const DesktopApp({Key? key}) : super(key: key);

  @override
  State<DesktopApp> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> {
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
      builder: (context, wid) {
        return Column(
          children: [
            Container(
                height: screenSize(context).height,
                color: Colors.cyan,
                child: wid ?? Container()),
          ],
        );
      },
      initialRoute: pages.elementAt(appStore!.tab).name,
    );
  }
}
