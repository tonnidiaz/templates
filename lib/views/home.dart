import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tu/functions.dart';
import 'package:tu/tu.dart';
import 'package:path/path.dart' as pth;
import 'package:tuned/floor/db.dart';
import 'package:tuned/main.dart';

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
      _formCtrl.setForm({
        "filename":
            db.database.database.path.split("/").last.replaceAll(".db", "")
      });

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
              suffix: const Text(".db"),
              required: true,
              hasBorder: false,
            ),
          )
        ],
        okTxt: "Continue",
        onOk: () async {
          gpop();
          final savePath =
              pth.join(saveDir, "${_formCtrl.form['filename']}.db");
          clog("SAVED AT: $savePath");
          if (await File(savePath).exists()) {
            await File(savePath).delete();
            clog("FILE DELETED");
          }
          await File(db.database.database.path).copy(savePath);

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
        final file = res.files[0];

        if (file.name.endsWith('.db')) {
          final newDir = Directory(pth.join(
              (await getExternalStorageDirectory())!.path, "db", "backup"));

          final newFilename = db.database.database.path.split("/").last;
          final dbCopy = File(file.path!);

          if (!(await newDir.exists())) {
            await newDir.create(recursive: true);
            clog("DIR CREATED");
          }
          final newPath = await dbCopy.copy(pth.join(newDir.path, newFilename));
          final mDB =
              await $FloorAppDatabase.databaseBuilder(newPath.path).build();
          clog((await mDB.settingsDao.findAll()).length);
          clog("DB PATH: ${mDB.database.database.path}");
          mDB.close();

          showToast("DB RESTORED").show(getCtx());
        } else {
          showToast("Filename must end with .db", isErr: true).show(getCtx());
        }
      }
    } catch (e) {
      clog(e);
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
