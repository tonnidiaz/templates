import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

String getAssetsDir() => path.join(path.dirname(Platform.resolvedExecutable),
    "data", "flutter_assets", "assets");

String getBinariesDir() {
  debugPrint("Exec: ${Platform.resolvedExecutable}");
  final assetsDir = getAssetsDir();

  String platFold = "";
  if (Platform.isLinux) {
    platFold = "linux";
  } else if (Platform.isWindows) {
    platFold = "win";
  } else if (Platform.isMacOS) {
    platFold = "macos";
  }
  return path.join(assetsDir, "bin", platFold);
}
