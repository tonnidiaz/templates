
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/utils/constants.dart';

import 'stores/app.dart';
import 'widgets/bottombar.dart';
import 'widgets/titlebars.dart';

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
    appStore??= context.watch<AppStore>();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            toolbarHeight: 40,
            centerTitle: true,
            //leadingWidth: 35,
            title:   Container(
              color: titlebarBG,
              child: MobileTitleBar(appStore!),
            ),
          ),
          body: SingleChildScrollView(child: pages.elementAt(appStore!.tab)),
          bottomNavigationBar: const TBottomBar()
      ),
    );
  }
}
