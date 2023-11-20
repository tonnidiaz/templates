import 'package:flutter/material.dart';
import 'package:tuned/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(MainApp.appCtrl.title)),
        body: const SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Home Page"),
            ],
          ),
        ));
  }
}
