import 'package:flutter/material.dart';
import 'package:tu/tu.dart';
import 'package:tu/utils/functions2.dart';
import 'package:tuned/main.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tuAppbar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          InfoItem(
            child: tuRow(children: [
              const Text("Dark mode"),
              Obx(
                () => Switch(
                    value: Tu.appCtrl.darkMode,
                    onChanged: (val) => Tu.appCtrl.darkMode = val),
              )
            ]),
          ),
          InfoItem(
            child: tuRow(children: [
              const Text("App version"),
              Text(MainApp.appCtrl.version)
            ]),
          ),
          InfoItem(
            child: const Text("Check updates"),
            onTap: () {
              checkUpdates(
                  appVersion: MainApp.appCtrl.version,
                  appId: MainApp.appCtrl.appId,
                  appName: MainApp.appCtrl.title);
            },
          ),
        ]),
      ),
    );
  }
}
