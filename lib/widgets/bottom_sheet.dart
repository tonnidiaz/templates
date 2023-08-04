import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../stores/app.dart';
import '/utils/constants.dart';
import 'common.dart';

class TBottomSheet extends StatefulWidget {
  const TBottomSheet({Key? key}) : super(key: key);

  @override
  State<TBottomSheet> createState() => _TBottomSheetState();
}

class _TBottomSheetState extends State<TBottomSheet> {
  AppStore? appStore;
  @override
  Widget build(BuildContext context) {
    appStore ??= context.watch<AppStore>();
    return Container(
      padding: defaultPadding,
      height: bottomSheetH,
      decoration: const BoxDecoration(
          color: titlebarBG,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...appStore!.navItems,
                    NavItem(
                        text: "Exit",
                        onClick: () async {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        }),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
