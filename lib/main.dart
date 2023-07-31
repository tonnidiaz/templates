
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mobile.dart';
import 'desktop.dart';
import 'stores/app.dart';
import 'utils/constants.dart';
import 'utils/functions.dart';

void main() {
  if (!isMobile) {
    setupWindowManager();
  }
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppStore())
    ],
    child: isMobile ? const MobileApp() : const DesktopApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final AppStore appStore = context.watch<AppStore>();
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(8.0),
            child: pages.elementAt(appStore.tab)),
      ),
    );
  }
}
