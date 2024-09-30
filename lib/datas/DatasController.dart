import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlisticonbutton.dart';
import 'package:globalfoodflutter/Reuses/foodlistnobutton.dart';

class datascontroller extends GetxController {
  var homeitems = <CustomListItemNobutton>[].obs;
  var menuitems = <CustomListItem>[].obs;
  var popularitem = <CustomListItem>[].obs;
  var orderitem = <Foodlisticonbutton>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadhomeitems();
    loadmenuitems();
    loadpopular();
  }

  void loadhomeitems() {
    homeitems.addAll([
      CustomListItemNobutton(image: "lib/drawable/fotomakanan/burger1.jpg", title: "Burger", description: "Sejenis sandwich yang di beri topping sayur sayuran dan daging sebagai lauknya, rasanya enak dan mudah untuk dikonsumsi"),
      CustomListItemNobutton(image: "lib/drawable/fotomakanan/pizza1.jpg", title: "Pizza", description: "Makanan ikonik dari Italia, bentuknya bulat dan tekstur yang khas"),
    ]);
  }

  void loadmenuitems() {
    menuitems.addAll([
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 1", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 1", "Iyah");}),
    ]);
  }

  void loadpopular() {
    popularitem.addAll([
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Pop 1", description: "Populer", buttonText: "Nggih", buttonColor: Colors.greenAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Populer", "Populer");}),
    ]);
  }

  void removeFromOrders(int index) {
    if (index >= 0 && index < orderitem.length) {
      orderitem.removeAt(index);
    } else {
      print("Invalid index: $index"); // Debugging purpose
    }
  }

  void clearOrders() {
    if (orderitem.isNotEmpty) {
      orderitem.clear();
      print("All items removed from orders."); // Optional for debugging
    } else {
      print("Order list is already empty."); // Optional for debugging
    }
  }


  void addToOrders(String image, String title, String description) {
    orderitem.add(Foodlisticonbutton(
      image: image,
      title: title,
      description: description,
      icon: Icon(Icons.cancel, color: Colors.white),
      buttonColor: Colors.redAccent,
      onButtonPressed: () => removeFromOrders(orderitem.length - 1),
    ));
  }

}