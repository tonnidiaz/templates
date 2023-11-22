import 'package:tu/tu.dart';

class FormCtrl extends GetxController {
  final form = RxMap<String, dynamic>();
  void setFormField(String key, dynamic val) {
    form.value = {...form, key: val};
  }

  void setForm(Map<String, dynamic> val) {
    form.value = val;
  }
}
