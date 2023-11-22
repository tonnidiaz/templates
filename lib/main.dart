import 'package:flutter/material.dart';
import 'package:tuned/controllers/app_ctrl.dart';
import 'package:tu/tu.dart';
import 'package:tuned/utils/config.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';
import 'controllers/form_ctrl.dart';
import 'routers/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //setupWindowManager();
  TuAppLovin.config();
  clog("RUNNING APP...");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  static AppCtrl appCtrl = Get.put(AppCtrl());
  static BarCtrl barCtrl = Get.put(BarCtrl());
  static FormCtrl formCtrl = Get.put(FormCtrl());
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends VisibilityAwareState<MainApp> {
  final _router = AppRouter().router;

  void _init() {
    Get.put(AppCtrl());
    Get.put(BarCtrl());
  }

  _onRouter() {
    clog("On router");
    try {
      final currentRoute = _router.routerDelegate.currentConfiguration.fullPath;
      if (currentRoute != MainApp.appCtrl.currentRoute) {
        MainApp.appCtrl.currentRoute = currentRoute;
      }
    } catch (e) {
      clog(e);
    }
  }

  @override
  void initState() {
    super.initState();
    clog("MAIN APP INIT");
    _init();
    _router.routerDelegate.addListener(_onRouter);
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
        routerConfig: _router,

        theme: TuTheme(
                context: context, colors: TuColors(), dark: Tu.appCtrl.darkMode)
            .theme(),
        debugShowCheckedModeBanner: false,
        //home: const Root(),
      ),
    );
  }
}
