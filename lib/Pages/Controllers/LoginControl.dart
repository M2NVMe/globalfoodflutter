import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/Controllers/responsifcontroller.dart';

class LoginControl extends GetxController {
  var usr = ''.obs;
  var pws = ''.obs;
  var isLoading = false.obs;
  final ResponsifController responsifController = Get.find();

  void login() {
    if (usr.value.isEmpty || pws.value.isEmpty) {
      Get.snackbar('Error', 'Username and password should not be empty');
      return;
    }

    isLoading.value = true;

    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;

      if (usr.value == 'User' && pws.value == 'Admin') {
        Get.snackbar('Success', 'Welcome!');

        Get.offNamed('/Responsif');
      } else {
        Get.snackbar('Invalid', 'Wrong username or password!');
      }
    });
  }
}
