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

  void _onItemTapped(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    // Init appStore
    _appStore ??= context.watch<AppStore>();

    return Container(
        color: titlebarBG,
        height: bottomBarH,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: pages.asMap().entries.map((e) {
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
            }).toList()));
  }
}
