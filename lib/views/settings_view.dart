import 'package:flutter/material.dart';
import 'package:tu/tu.dart';

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
          )
        ]),
      ),
    );
  }
}
