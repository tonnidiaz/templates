import 'package:flutter/widgets.dart';

class AppStore extends ChangeNotifier {
  String _company = "Tunedbass";
  String get company => _company;
  void set_company(String val) {
    _company = val;
    notifyListeners();
  }

  String _title = "Tunedbass App";
  String get title => _title;
  void set_title(String val) {
    _title = val;
    notifyListeners();
  }

  int _tab = 0;
  int get tab => _tab;
  void set_tab(int val) {
    _tab = val;
    notifyListeners();
  }

  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void set_isLoading(bool val) {
    _isLoading = val;
    _backEnabled = !val;
    notifyListeners();
  }

  bool _backEnabled = true;
  bool get backEnabled => _backEnabled;
  void set_backEnabled(bool val) {
    _backEnabled = val;
    _isLoading = !val;
    notifyListeners();
  }

  List<Widget> _navItems = [];
  List<Widget> get navItems => _navItems;
  void set_navItems(List<Widget> val) {
    _navItems = val;
    notifyListeners();
  }
}
