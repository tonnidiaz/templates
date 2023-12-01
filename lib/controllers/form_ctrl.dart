import 'package:tu/tu.dart';

class FormCtrl extends GetxController {
  final _form = Rx<Map<String, dynamic>>({});
  Map<String, dynamic> get form => _form.value;
  set form(Map<String, dynamic> val) => _form.value = val;

  void setForm(Map<String, dynamic> val) {
    _form.value = val;
  }

  void setFormField(String key, dynamic val) => _form.value[key] = val;
}
