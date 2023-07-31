import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/widgets/sidebar.dart';
import '/utils/constants.dart';
import 'package:window_manager/window_manager.dart';

import 'stores/app.dart';
import 'widgets/titlebars.dart';


class DesktopApp extends StatefulWidget {
  const DesktopApp({super.key});
  @override
  State<DesktopApp> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> with WindowListener {
  AppStore? _appStore;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _appStore??= context.watch<AppStore>();

    return  MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            titleSpacing: 3,
            elevation: 0,
            toolbarHeight: 40,
            centerTitle: true,
            //leadingWidth: 35,
            title:   Container(
              color: titlebarBG,
              child: InkWell(
                  enableFeedback: false,
                  mouseCursor: SystemMouseCursors.move,
                  onTapDown: (d) async {
                    await windowManager.startDragging();
                  },

                  child: DesktopTitleBar(_appStore!)
              ),
            ),
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TSidebar(),
              SingleChildScrollView(child: pages.elementAt(_appStore!.tab)),
            ],
          ),
      ),
    );
  }
}
