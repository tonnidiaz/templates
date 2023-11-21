import 'package:flutter/material.dart';
import 'package:tuned/controllers/app_ctrl.dart';

import 'package:tu/tu.dart';

import 'views/root/root_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //setupWindowManager();

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

    return Obx(
      () => GetMaterialApp(
        theme: TuTheme(
                context: context, colors: TuColors(), dark: Tu.appCtrl.darkMode)
            .theme(),
        debugShowCheckedModeBanner: false,
        home: const Root(),
      ),
    );
  }
}
