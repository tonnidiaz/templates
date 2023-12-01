import 'package:isar/isar.dart';
part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool autoCheckUpdates = true;
  bool darkMode = true;
}
