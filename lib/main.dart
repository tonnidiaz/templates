import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuned/controllers/app_ctrl.dart';

import 'package:tu/tu.dart';
import 'package:tuned/utils/config.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

import 'views/root/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //setupWindowManager();
  await TuAppLovin.config();
  runApp(const MainApp());
}

final router = GoRouter(initialLocation: '/', navigatorKey: Get.key, routes: [
  ShellRoute(
      builder: (context, state, child) => RootView(child: child),
      routes: [
        ...RootView.routes.map(
          (e) => GoRoute(
            name: e.to,
            path: e.to,
            builder: (context, state) => e.widget,
          ),
        ),
      ]),
]);

class MainApp extends StatefulWidget {
  static AppCtrl appCtrl = Get.put(AppCtrl());
  static BarCtrl barCtrl = Get.put(BarCtrl());
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends VisibilityAwareState<MainApp> {
  void _init() {
    Get.put(AppCtrl());
    Get.put(BarCtrl());
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _onVisibilityChanged(WidgetVisibility visibility) {
    clog("VISIBILITY CHANGED: ${visibility.toString()}");
    MainApp.appCtrl.isVisible = visibility == WidgetVisibility.VISIBLE;
  }

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    _onVisibilityChanged(visibility);
    super.onVisibilityChanged(visibility);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp.router(
        routerConfig: router,

        theme: TuTheme(
                context: context, colors: TuColors(), dark: Tu.appCtrl.darkMode)
            .theme(),
        debugShowCheckedModeBanner: false,
        //home: const Root(),
      ),
    );
  }
}
