import 'package:tu/tu.dart';

class AppCtrl extends GetxController {
  final _title = Rx<String>("Tunedbass");
  String get title => _title.value;
  set title(String val) => _title.value = val;

  final _appId = Rx<String>("com.tb.tb");
  String get appId => _appId.value;
  set appId(String val) => _appId.value = val;

  final _email = Rx<String>("tunedstreamz@gmail.com");
  String get email => _email.value;
  set email(String val) => _email.value = val;

  var isLoading = false.obs;
  void setIsLoading(bool val) {
    isLoading.value = val;
    backEnabled.value = !val;
  }

  var backEnabled = true.obs;
  void setBackEnabled(bool val) {
    backEnabled.value = val;
  }

  final _version = Rx<String>("");
  String get version => _version.value;
  set version(String val) => _version.value = val;

  _getAppVersion() async {
    version = await getAppVersion();
  }

  final _currentRoute = Rx("/");
  String get currentRoute => _currentRoute.value;
  set currentRoute(String val) => _currentRoute.value = val;

  final _isVisible = Rx<bool>(true);
  bool get isVisible => _isVisible.value;
  set isVisible(bool val) => _isVisible.value = val;
  @override
  void onInit() {
    super.onInit();
    _getAppVersion();
  }

  final _applovinReady = Rx<bool>(false);
  bool get applovinReady => _applovinReady.value;
  set applovinReady(bool val) => _applovinReady.value = val;
}
