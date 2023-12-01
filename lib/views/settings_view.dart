import 'package:flutter/material.dart';
import 'package:tu/functions.dart';
import 'package:tu/tu.dart';

import '../main.dart';
import '../models/floor/settings.dart';
import '../utils/constants.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Settings? _appSettings;

  _init() async {
    var res = await db.settingsDao.findById(1);
    if (context.mounted) {
      setState(() {
        _appSettings = res;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final appCtrl = MainApp.appCtrl;
    return Scaffold(
      appBar: tuAppbar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            mY(topMargin),
            Visibility(
              visible: false,
              child: InfoItem(
                child: tuRow(children: [
                  const Text("Dark mode"),
                  Obx(
                    () => Switch(
                        value: Tu.appCtrl.darkMode,
                        onChanged: (val) async {
                          await db.settingsDao
                              .insertOne(_appSettings!..darkMode = val);
                          Tu.appCtrl.darkMode = val;
                        }),
                  )
                ]),
              ),
            ),
            InfoItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("App version"),
                  Obx(() => Text(MainApp.appCtrl.version)),
                ],
              ),
            ),
            InfoItem(
              child: tuRow(children: [
                const Text("Auto check updates"),
                Obx(
                  () => Switch(
                      value: appCtrl.autoCheckUpdates,
                      onChanged: (val) async {
                        _appSettings!.autoCheckUpdates = true;
                        _appSettings.c
                        await db.settingsDao.updateOne(_appSettings!);

                        clog((await db.settingsDao.findAll())[0]
                            .autoCheckUpdates);
                        appCtrl.autoCheckUpdates = val;
                      }),
                )
              ]),
            ),
            InfoItem(
              child: const Text("Check updates"),
              onTap: () async {
                await checkUpdates(
                    appVersion: appCtrl.version,
                    appId: 'com.tb.tulyrics',
                    appName: appCtrl.title);
              },
            ),
          ],
        ),
      ),
    );
  }
}
