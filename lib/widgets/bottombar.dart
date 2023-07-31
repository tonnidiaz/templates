import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/app.dart';
import '../utils/constants.dart';

class TBottomBar extends StatefulWidget {
  const TBottomBar({Key? key}) : super(key: key);

  @override
  State<TBottomBar> createState() => _TBottomBarState();
}

class _TBottomBarState extends State<TBottomBar> {
  AppStore? _appStore;
  
  void _onItemTapped(int index) {
    _appStore!.set_tab(index);
  }
  @override
  Widget build(BuildContext context) {
    // Init appStore
    _appStore??= context.watch<AppStore>();
    
    return Container(
        color: titlebarBG,
        height: bottomBarH,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                splashRadius: splashRadius,
                iconSize: iconSize,
                color: _appStore!.tab == 0 ? Colors.orange : Colors.white,
                onPressed: () {
                  _onItemTapped(0);
                },
                icon: const Icon(CupertinoIcons.home)),

            IconButton(
                splashRadius: splashRadius,
                iconSize: iconSize,
                color: _appStore!.tab == 1 ? Colors.orange : Colors.white,
                onPressed: () {
                  _onItemTapped(1);
                },
                icon: const Icon(CupertinoIcons.info)),
          ],
        ));
  }
}
