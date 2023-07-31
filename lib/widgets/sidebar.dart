import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/app.dart';
import '../utils/constants.dart';

class TSidebar extends StatefulWidget {
  const TSidebar({Key? key}) : super(key: key);

  @override
  State<TSidebar> createState() => _TSidebarState();
}

class _TSidebarState extends State<TSidebar> {
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
        width: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    splashRadius: splashRadius,
                    iconSize: iconSize - 5,
                    color: _appStore!.tab == 0 ? Colors.orange : Colors.white,
                    onPressed: () {
                      _onItemTapped(0);
                    },
                    icon: const Icon(CupertinoIcons.home)),
                IconButton(
                    splashRadius: splashRadius,
                    iconSize: iconSize - 5,
                    color: _appStore!.tab == 1 ? Colors.orange : Colors.white,
                    onPressed: () {
                      _onItemTapped(1);
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                    splashRadius: splashRadius,
                    iconSize: iconSize - 5 + 7,
                    color: _appStore!.tab == 2 ? Colors.orange : Colors.white,
                    onPressed: () {
                      _onItemTapped(2);
                    },
                    icon: const Icon(Icons.swap_horiz)),


              ],
            ),
            IconButton(
                splashRadius: splashRadius,
                iconSize: iconSize - 5,
                color: _appStore!.tab == 3 ? Colors.orange : Colors.white,
                onPressed: () {
                  _onItemTapped(3);
                },
                icon: const Icon(CupertinoIcons.info)),
          ],
        ));
  }
}
