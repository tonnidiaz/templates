import 'package:flutter/material.dart';
import 'package:tu/views.dart';
import 'package:tuned/views/about.dart';
import 'package:tuned/views/settings_view.dart';
import 'package:tuned/widgets/sidebar.dart';
import 'package:tu/tu.dart';

import '../home.dart';

class RootCtrl extends GetxController {
  final _currentTab = Rx<int>(0);
  int get currentTab => _currentTab.value;
  set currentTab(int val) => _currentTab.value = val;

  final _tabs = Rx<List<TuPage>>([
    TuPage('/', const HomePage(), icon: Icons.home_outlined, label: "Home"),
    TuPage('/widgets', const WidgetsView(),
        icon: Icons.apps_outlined, label: "Widgets"),
    TuPage('/about', const AboutView(),
        icon: Icons.info_outline, label: "About", isAction: true),
    TuPage('/settings', const SettingsView(),
        icon: Icons.settings_outlined, label: "Settings", isAction: true),
  ]);
  List<TuPage> get tabs => _tabs.value;
}

class Root extends StatelessWidget {
  const Root({super.key});

  static RootCtrl ctrl = Get.put(RootCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        height: screenSize(context).height,
        width: double.infinity,
        child: Row(
          children: [
            !isMobile ? const TuSidebar() : none(),
            Expanded(
                child: Obx(
              () => Container(
                  color: Colors.amber,
                  height: screenSize(context).height,
                  width: double.infinity,
                  child: ctrl.tabs.elementAt(ctrl.currentTab).widget),
            ))
          ],
        ),
      ),
      bottomNavigationBar: isMobile
          ? Obx(
              () => BottomNavigationBar(
                onTap: (val) {
                  ctrl.currentTab = val;
                },
                currentIndex: ctrl.currentTab,
                items: ctrl.tabs
                    .map((e) => BottomNavigationBarItem(
                        icon: Icon(e.icon), label: e.label))
                    .toList(),
              ),
            )
          : null,
    );
  }
}
