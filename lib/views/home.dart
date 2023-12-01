import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu/tu.dart';
import 'package:tuned/main.dart';

import '../utils/isar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    clog('HOME PAGE');
    return Scaffold(
        appBar: tuAppbar(title: Text(MainApp.appCtrl.title), actions: [
          const TuPopupBtn(
            items: [
              PopupMenuItem(
                  child: TuPopupBtn(
                items: [
                  PopupMenuItem(
                    onTap: TuIsar.backup,
                    child: Text("Backup"),
                  ),
                  PopupMenuItem(
                    onTap: TuIsar.restore,
                    child: Text("Restore"),
                  ),
                ],
                child: Text("Backup / Restore"),
              ))
            ],
          )
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // clog(db.database.database.);
            },
            child: const Icon(Icons.add)),
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
