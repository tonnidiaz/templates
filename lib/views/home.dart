import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu/tu.dart';
import 'package:tuned/main.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    clog('HOME PAGE');
    return Scaffold(
        appBar: AppBar(title: Text(MainApp.appCtrl.title)),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Home Page"),
              TuButton(
                text: "Click me",
                onPressed: () async {
                  showProgressSheet();
                  await sleep(2000);
                  gpop();
                  context.goNamed('/settings');
                },
              )
            ],
          ),
        ));
  }
}
