@Entity()
class Settings {
  @Id()
  int id = 0;
  
  bool darkMode = true;
  bool autoCheckUpdates = true;
}