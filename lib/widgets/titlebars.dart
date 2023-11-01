import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuned/controllers/app_ctrl.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

import 'package:window_manager/window_manager.dart';

AppBar mobileAppbar({String? title = "Tanverter"}) {
  final AppCtrl appCtrl = Get.find();
  return AppBar(
    leading: Builder(builder: (context) {
      return IconButton(onPressed: () {}, icon: const Icon(Icons.sort));
    }),
    title: Obx(
        () => Text(appCtrl.title.value, style: const TextStyle(fontSize: 16))),
    actions: [
      SizedBox(
        width: 35,
        child: PopupMenuButton(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  padding: const EdgeInsets.all(4),
                  child: iconText("About", Icons.info, fontSize: 18,
                      onClick: () async {
                    await Navigator.pushNamed(context, "/about");
                  }),
                )
              ];
            }),
      )
    ],
  );
}

AppBar desktopAppbar() {
  final AppCtrl appCtrl = Get.find();
  return AppBar(
    titleSpacing: 0,
    centerTitle: true,
    leadingWidth: 0,
    leading: const Text(""),
    title: SizedBox(
      width: double.infinity,
      child: GestureDetector(
        //enableFeedback: false,
        // mouseCursor: SystemMouseCursors.move,
        onTapDown: (d) async {
          await windowManager.startDragging();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 45,
              child: MenuBar(
                children: [
                  Obx(() => SubmenuButton(
                          menuChildren: [
                            MenuItemButton(
                              shortcut:
                                  const CharacterActivator("E", control: true),
                              onPressed: () async {
                                clog("Closing app");
                                await windowManager.close();
                              },
                              child: const Text("Exit"),
                            ),
                          ],
                          child: Builder(builder: (context) {
                            return const Icon(Icons.sort);
                          })))
                ],
              ),
            ),
            Text(
              appCtrl.title.value,
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              //id=actions
              children: [
                ActionBtn(CupertinoIcons.minus_circle_fill,
                    color: Colors.yellow, onClick: () async {
                  await windowManager.minimize();
                }),
                ActionBtn(CupertinoIcons.add_circled_solid, color: Colors.green,
                    onClick: () async {
                  if (await windowManager.isMaximized()) {
                    await windowManager.unmaximize();
                  } else {
                    await windowManager.maximize();
                  }
                }),
                ActionBtn(CupertinoIcons.multiply_circle_fill,
                    color: Colors.red, onClick: () async {
                  await windowManager.close();
                }),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

class ActionBtn extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Function()? onClick;
  const ActionBtn(this.icon, {super.key, this.color, this.onClick});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 16;
    return SizedBox(
      width: 35,
      height: 35,
      child: InkWell(
        mouseCursor: SystemMouseCursors.basic,
        enableFeedback: true,
        onTap: onClick,
        onTapDown: (e) {
          clog("ontap");
        },
        child: Icon(
          icon,
          size: iconSize,
          color: color,
        ),
      ),
    );
  }
}
