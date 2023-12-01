import 'package:floor/floor.dart';

@entity
class Settings {
  @PrimaryKey(autoGenerate: true)
  int? id;

  bool autoCheckUpdates = true;
  bool darkMode = true;
}

@dao
abstract class SettingsDao {
  @Query("SELECT * FROM Settings")
  Future<List<Settings>> findAll();

  @Query("SELECT * FROM Settings WHERE id = :id")
  Future<Settings?> findById(int id);

  @insert
  Future<void> insertOne(Settings inp);

  @update
  Future<void> updateOne(Settings inp);

  @update
  Future<void> updateMany(List<Settings> inp);

  @delete
  Future<void> deleteOne(Settings inp);

  @delete
  Future<void> deleteMany(List<Settings> inp);
}
