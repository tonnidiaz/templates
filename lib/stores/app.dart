import 'package:flutter/widgets.dart';

class AppStore extends ChangeNotifier{

  String _company = "Tunedbass";
  String get company => _company;
  void set_company(String val){
    _company = val;
    notifyListeners();
  }
  String _title = "Tunedbass App";
  String get title => _title;
  void set_title(String val){
    _title = val;
    notifyListeners();
  }

  int _tab = 0;
  int get tab => _tab;
  void set_tab(int val){
    _tab = val;
    notifyListeners();
  }

}