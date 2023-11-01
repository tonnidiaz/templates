import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:tu/tu.dart';
import 'package:tu/widgets/dialog.dart';
import 'package:via_logger/logger.dart';

class WidgetsPage extends HookWidget {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = useState("");
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets")),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("I gonna be ninja"),
              mY(6),
              TuButton(
                text: "Click me",
                onPressed: () async {
                  Logger.info('Pressed');
                  //showProgressSheet();
                  await sleep(1600);
                  //gpop();
                },
              ),
              mY(6),
              TuFormField(
                width: 200,
                label: "Username:",
                hint: "Enter username...",
                value: username.value,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.info),
                onChanged: (val) {
                  username.value = val;
                },
              ),
              mY(6),
              TuFormField(
                width: 200,
                hasBorder: false,
                hint: "Username:",
                value: username.value,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.info),
                onChanged: (val) {
                  username.value = val;
                },
              ),
              mY(6),
              const CircularProgressIndicator(),
              mY(10),
              const Chip(label: Text("Pending")),
              mY(10),
              TextButton(onPressed: () {}, child: const Text("Text button")),
              mY(10),
              TuSelect(
                label: "Country:",
                width: 200,
                value: "sa",
                onChanged: (val) {},
                items: [
                  SelectItem("SA", "sa"),
                  SelectItem("United States", "usa")
                ],
              ),
              mY(10),
              Obx(
                () => TuLabeledCheckbox(
                  label: "Dark mode:",
                  value: Tu.appCtrl.darkMode.value,
                  onChanged: (val) {
                    Tu.appCtrl.setDarkMode(val == true);
                  },
                ),
              ),
              mY(10),
              TuButton(
                text: "SHow dialog:",
                onPressed: () {
                  TuFuncs.dialog(
                      context,
                      TuDialogView(
                        title: "Hello",
                        content: tuColumn(
                          min: true,
                          children: [
                            const Text("World"),
                            Obx(
                              () => TuLabeledCheckbox(
                                label: "Dark mode:",
                                value: Tu.appCtrl.darkMode.value,
                                onChanged: (val) {
                                  Tu.appCtrl.setDarkMode(val == true);
                                },
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
