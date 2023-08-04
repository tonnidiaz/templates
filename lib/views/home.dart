import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frust/utils/functions.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../stores/app.dart';
import '/utils/constants.dart';
import '/widgets/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        child: Container(
      width: isMobile
          ? screenSize(context).width
          : screenSize(context).width - bottomBarH,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home Pages"),
          /* tButton("Counter: ${PageWrapper.appStore!.counter}", onClick: () {
            PageWrapper.appStore!.increment();
          }) */
        ],
      ),
    ));
  }
}
