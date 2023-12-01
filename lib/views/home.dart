import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tu/functions.dart';
import 'package:tu/tu.dart';
import 'package:path/path.dart' as pth;
import 'package:tuned/main.dart';

import '../models/settings.dart';
import '../utils/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formCtrl = MainApp.formCtrl;

  _backupDB() async {
    clog(isar.path);

    try {
      if (!(await requestStoragePermission())) return;
      final saveDir = await FilePicker.platform.getDirectoryPath(
        dialogTitle: "Save at",
      );
      if (saveDir == null) return;
      clog("Save dir: $saveDir");
      _formCtrl.setForm({"filename": isar.name.replaceAll(".isar", "")});

      Get.dialog(TuDialogView(
        isForm: true,
        fields: [
          const Text("Save as:"),
          mY(10),
          Obx(
            () => TuFormField(
              hint: "Filename:",
              radius: 15,
              onChanged: (val) {
                _formCtrl.setFormField('filename', val);
              },
              value: _formCtrl.form['filename'],
              suffix: const Text(".isar"),
              required: true,
              hasBorder: false,
            ),
          )
        ],
        okTxt: "Continue",
        onOk: () async {
          gpop();
          final savePath =
              pth.join(saveDir, "${_formCtrl.form['filename']}.isar");
          clog("SAVED AT: $savePath");
          if (await File(savePath).exists()) {
            await File(savePath).delete();
            clog("FILE DELETED");
          }
          await isar.copyToFile(savePath);
          showToast("DB backed up").show(getCtx());
        },
      ));
    } catch (e) {
      clog(e);
      showToast('Failed to backup db', isErr: true).show(Get.overlayContext!);
    }
  }

  _restoreDB() async {
    try {
      if (!(await requestStoragePermission())) return;
      final res = await FilePicker.platform.pickFiles();
      if (res != null) {
        final db = res.files[0];

        if (db.name.endsWith('.isar')) {
          final newDir = Directory(pth.join(
              (await getExternalStorageDirectory())!.path, "db", "backup"));

          final newFilename = "${isar.name}.backup.isar";
          final dbCopy = File(db.path!);

          // Create newDir if no exists
          if (!(await newDir.exists())) {
            await newDir.create(recursive: true);
            clog("DIR CREATED");
          }
          await dbCopy.copy(pth.join(newDir.path, newFilename));
          final mIsar = await Isar.open([SettingsSchema],
              directory: newDir.path,
              name: newFilename.replaceAll(".isar", ""));
          mIsar.close();

          showToast("DB RESTORED").show(getCtx());
        } else {
          showToast("Filename must end with .isar", isErr: true).show(getCtx());
        }
      }
    } catch (e) {
      clog(e);
      showToast('Failed to restore db', isErr: true).show(Get.overlayContext!);
    }
  }

  @override
  Widget build(BuildContext context) {
    clog('HOME PAGE');
    return Scaffold(
        appBar: tuAppbar(title: Text(MainApp.appCtrl.title), actions: [
          TuPopupBtn(
            items: [
              PopupMenuItem(
                  child: TuPopupBtn(
                items: [
                  PopupMenuItem(
                    onTap: _backupDB,
                    child: const Text("Backup"),
                  ),
                  PopupMenuItem(
                    onTap: _restoreDB,
                    child: const Text("Restore"),
                  ),
                ],
                child: const Text("Backup / Restore"),
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
