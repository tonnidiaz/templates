import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tuned/views/root/index.view.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

class TuSidebar extends HookWidget {
  const TuSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootCtrl = Root.ctrl;

    return Obx(
      () => Container(
          color: TuColors.bg1(),
          width: appBarH,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: rootCtrl.tabs
                      .where((it) => !it.isAction)
                      .toList()
                      .asMap()
                      .entries
                      .map((e) {
                    return SizedBox(
                      height: appBarH,
                      child: IconButton(
                          splashRadius: splashRadius,
                          iconSize: iconSize,
                          color: rootCtrl.currentTab == e.key
                              ? TuColors.primary
                              : null,
                          onPressed: () {
                            rootCtrl.currentTab = e.key;
                          },
                          icon: Icon(e.value.icon)),
                    );
                  }).toList()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: rootCtrl.tabs
                    .where((it) => it.isAction)
                    .toList()
                    .asMap()
                    .entries
                    .map((e) {
                  final index =
                      e.key + rootCtrl.tabs.where((it) => !it.isAction).length;
                  return SizedBox(
                    height: appBarH,
                    child: IconButton(
                        splashRadius: splashRadius,
                        color: rootCtrl.currentTab == index
                            ? TuColors.primary
                            : null,
                        onPressed: () {
                          rootCtrl.currentTab = index;
                        },
                        icon: Icon(e.value.icon)),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }
}
