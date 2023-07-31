import 'package:flutter/cupertino.dart';
import '/utils/constants.dart';
import 'package:window_manager/window_manager.dart';

void clog(Object p){
  debugPrint("$tag: $p");
}

void setupWindowManager()async{
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(700, 400),
    center: true,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
