import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tuned/main.dart';

late Isar isar;
Future<String> getThumbnailsDir() async {
  final dir =
      "${(await getTemporaryDirectory()).path}/${MainApp.appCtrl.appId}/temp";
  final _dir = Directory(dir);
  if (!_dir.existsSync()) {
    _dir.createSync(recursive: true);
  }
  return dir;
}
