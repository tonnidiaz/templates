import 'package:flutter/material.dart';
import 'package:tu/tu.dart';
import '../utils/constants.dart';

class TBottomBar extends StatefulWidget {
  const TBottomBar({Key? key}) : super(key: key);

  @override
  State<TBottomBar> createState() => _TBottomBarState();
}

class _TBottomBarState extends State<TBottomBar> {
  void _onItemTapped(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: TuColors.titlebarBG,
        height: bottomBarH,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: pages.asMap().entries.map((e) {
              return IconButton(
                  splashRadius: splashRadius,
                  iconSize: iconSize,
                  color: ModalRoute.of(context)?.settings.name == e.value.to
                      ? Colors.orange
                      : Colors.white,
                  onPressed: () {
                    //    _onItemTapped(e.value.to);
                  },
                  icon: Icon(e.value.icon));
            }).toList()));
  }
}