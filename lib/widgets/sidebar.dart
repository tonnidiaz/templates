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

  void _onItemTapped(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    // Init appStore
    _appStore ??= context.watch<AppStore>();

    return Container(
        color: titlebarBG,
        width: sidebarW,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: pages
                    .where((it) => !it.isAction)
                    .toList()
                    .asMap()
                    .entries
                    .map((e) {
                  return IconButton(
                      splashRadius: splashRadius,
                      iconSize: iconSize,
                      color:
                          ModalRoute.of(context)?.settings.name == e.value.name
                              ? Colors.orange
                              : Colors.white,
                      onPressed: () {
                        _onItemTapped(e.value.name);
                      },
                      icon: Icon(e.value.icon));
                }).toList()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: pages
                  .where((it) => it.isAction)
                  .toList()
                  .asMap()
                  .entries
                  .map((e) {
                return IconButton(
                    splashRadius: splashRadius,
                    iconSize: iconSize,
                    color: ModalRoute.of(context)?.settings.name == e.value.name
                        ? Colors.orange
                        : Colors.white,
                    onPressed: () {
                      _onItemTapped(e.value.name);
                    },
                    icon: Icon(e.value.icon));
              }).toList(),
            ),
          ],
        ));
  }
}
