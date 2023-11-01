import 'package:flutter/material.dart';
import 'package:tuned/controllers/app_ctrl.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final AppCtrl _appCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("About us"),
          Obx(() => TuButton(
              text: "Is enabled: ${_appCtrl.backEnabled}",
              onPressed: () {
                _appCtrl.setBackEnabled(!_appCtrl.backEnabled.value);
              }))
        ],
      ),
    ));
  }
}
