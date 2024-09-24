import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Reuses/foodlistnobutton.dart';

class datascontroller extends GetxController {
  var homeitems = <CustomListItemNobutton>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadhomeitems();
  }

  void loadhomeitems() {
    homeitems.addAll([
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 1", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 2", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 3", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 4", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 5", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 6", description: "Makanan ini sangat enak dan sangat murah ygy"),
    ]);
  }
}