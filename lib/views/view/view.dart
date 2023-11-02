import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';
import './ctrl.dart';

class View extends StatelessWidget {
  const View({super.key});

  static Ctrl ctrl = Get.put(Ctrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tuAppbar(title: const Text("View")),
    );
  }
}
