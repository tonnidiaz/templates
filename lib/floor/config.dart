import 'package:path_provider/path_provider.dart';
import 'package:tuned/floor/db.dart';

import '../utils/constants.dart';
import 'package:path/path.dart' as pth;

Future<void> configFloor() async {
  db = await $FloorAppDatabase
      .databaseBuilder(
          pth.join((await getExternalStorageDirectory())!.path, "db", "app.db"))
      .build();
}
