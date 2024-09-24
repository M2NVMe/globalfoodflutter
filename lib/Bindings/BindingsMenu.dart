import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/Controllers/LoginControl.dart';

class Bindingsmenu extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControl());
  }
}