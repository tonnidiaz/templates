import 'package:flutter/material.dart';
import '../.lib/controllers/app_ctrl.dart';
import 'package:tu/tu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //setupWindowManager();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static AppCtrl appCtrl = Get.put(AppCtrl());
  // static BarCtrl barCtrl = Get.put(BarCtrl());
  const MainApp({super.key});

  void _init() {
    Get.put(AppCtrl());
    //  Get.put(BarCtrl());
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return Obx(
      () => GetMaterialApp(
        theme: MTuTheme(colors: MTuColors(), dark: Tu.appCtrl.darkMode.value)
            .theme(),
        debugShowCheckedModeBanner: false,
        home: const MRoot(),
      ),
    );
    //isMobile ? const MobileApp() : const DesktopApp();
  }
}

extension E on dynamic {
  //bool get dark => MTuTheme.instance.dark;
  MTuColors get colors => MTuTheme.instance.colors;
}

class MRoot extends StatelessWidget {
  const MRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TU")),
      body: Obx(
        () => Column(
          children: [
            Center(
                child: Obx(
              () => Switch(
                value: Tu.appCtrl.darkMode.value,
                onChanged: (value) {
                  Tu.appCtrl.darkMode.value = value;
                },
              ),
            )),
            Text(
              "HELLO",
              style: TextStyle(color: colors.color),
            )
          ],
        ),
      ),
    );
  }
}

class MTuColors {
  bool dark() => Tu.appCtrl.darkMode.value;
  final Color _bgCardDark = const Color.fromRGBO(56, 56, 56, 1);
  final Color _bgCard = const Color.fromRGBO(250, 247, 245, 1);
  Color get bgCard => MTuTheme.instance.dark ? _bgCardDark : _bgCard;

  final Color _colorDark = Colors.red;
  final Color _color = Colors.green;
  Color get color => dark() ? _colorDark : _color;
}

class MTuTheme {
  static late MTuTheme instance;
  late MTuColors colors;
  final bool dark;
  MTuTheme({required this.colors, this.dark = true}) {
    instance = this;
  }

  ThemeData theme() {
    debugPrint("dark: $dark");
    debugPrint("darkk: ${MTuTheme.instance.dark}");
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: colors.bgCard,
        brightness: dark ? Brightness.dark : Brightness.light);
  }
}
