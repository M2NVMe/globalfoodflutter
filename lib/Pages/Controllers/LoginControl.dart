import 'package:get/get.dart';

class LoginControl extends GetxController { // Change to PascalCase
  var usr = ''.obs;
  var pws = ''.obs;

  void login() {
    if (usr.value.isEmpty || pws.value.isEmpty) {
      Get.snackbar('Error', 'Username and password should not be empty');
      return;
    }

    Future.delayed(Duration(seconds: 2), () {
      if (usr.value == 'User' && pws.value == 'Admin') {
        Get.snackbar('Success', 'Welcome!');
        Get.offNamed('/Dashboard');
      } else {
        Get.snackbar('Invalid', 'Wrong username or password!');
      }
    });
  }
}
