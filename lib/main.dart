import 'package:flutter/material.dart';
import 'package:tuned/controllers/app_ctrl.dart';
import 'package:tuned/utils/classes/index.class.dart';
import 'package:tuned/views/root/index.view.dart';

import 'package:get/get.dart';
import 'utils/constants.dart';
import 'package:tu/tu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupWindowManager();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static AppCtrl appCtrl = Get.put(AppCtrl());
  static BarCtrl barCtrl = Get.put(BarCtrl());
  const MainApp({super.key});

  void _init() {
    Get.put(AppCtrl());
    Get.put(BarCtrl());
  }

  @override
  Widget build(BuildContext context) {
    _init();
    Map<String, Widget Function(BuildContext)> routes = {};
    for (var page in pages.where((e) => e.to != null)) {
      routes[page.to!] = (context) => page.widget;
    }
    return Obx(
      () => GetMaterialApp(
        theme: tuTheme(dark: Tu.appCtrl.darkMode.value),
        debugShowCheckedModeBanner: false,
        scrollBehavior: isMobile ? MyCustomScrollBehavior() : null,
        home: const Root(),
      ),
    );
    //isMobile ? const MobileApp() : const DesktopApp();
  }
}
