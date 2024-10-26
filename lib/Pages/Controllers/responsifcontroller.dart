import 'package:get/get.dart';

class ResponsifController extends GetxController{
  var screenwidth = 0.0.obs;

  //Untuk update width screen var
  void updateScreenWidth(double width) {
    screenwidth.value = width;
    print("lebar layarnya adalah : " + screenwidth.value.toString());
  }

  bool isMobile() => screenwidth.value < 600;
  bool isTablet() => screenwidth.value >= 600 && screenwidth.value <1450;
}