import 'package:flutter/material.dart';
import 'package:tuned/controllers/app_ctrl.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppCtrl appCtrl = Get.find();
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Home Page"),
              Obx(() => TuButton(
                  text: "Counter: ${appCtrl.count}",
                  onPressed: () {
                    appCtrl.increment();
                  }))
            ],
          ),
        ));
  }
}
