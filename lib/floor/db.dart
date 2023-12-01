import 'dart:async';

import 'package:floor/floor.dart';
import 'package:tuned/models/floor/settings.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'db.g.dart';

@Database(version: 1, entities: [Settings])
abstract class AppDatabase extends FloorDatabase {
  SettingsDao get settingsDao;
}
