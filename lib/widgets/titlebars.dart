import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '/utils/functions.dart';

import 'package:window_manager/window_manager.dart';

import '../stores/app.dart';
import 'bottom_sheet.dart';
import 'common.dart';

AppBar MobileTitleBar(AppStore appStore, {String? title = "Tanverter"}) {
  return AppBar(
    titleSpacing: 0,
    backgroundColor: appBG,
    elevation: 0,
    toolbarHeight: bottomBarH,
    centerTitle: true,
    leadingWidth: 45,
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return const TBottomSheet();
              },
            );
          },
          icon: const Icon(Icons.sort));
    }),
    title: Text(appStore.title, style: const TextStyle(fontSize: 16)),
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

AppBar DesktopTitleBar(AppStore appStore) {
  return AppBar(
    titleSpacing: 0,
    elevation: 0,
    toolbarHeight: 35,
    centerTitle: true,
    leadingWidth: 0,
    leading: const Text(""),
    title: Container(
      width: double.infinity,
      color: titlebarBG,
      child: InkWell(
        enableFeedback: false,
        mouseCursor: SystemMouseCursors.move,
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
                  SubmenuButton(
                      menuChildren: [
                        ...appStore.mainMenu,
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
                      }))
                ],
              ),
            ),
            Text(
              appStore.title,
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

Widget ActionBtn(IconData icon, {Color? color, void Function()? onClick}) {
  const double iconSize = 16;
  return Container(
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
