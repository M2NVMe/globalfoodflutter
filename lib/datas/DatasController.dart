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
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 1", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 2", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 3", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 4", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 5", description: "Makanan ini sangat enak dan sangat murah ygy"),
      CustomListItemNobutton(image: "lib/drawable/Logo.png", title: "Ini makanan 6", description: "Makanan ini sangat enak dan sangat murah ygy"),
    ]);
  }

  void loadmenuitems() {
    menuitems.addAll([
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 1", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 1", "Iyah");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 2", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 2", "Iyah");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 3", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 3", "Iyah");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 4", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 4", "Iyah");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 5", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 5", "Iyah");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 6", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 6", "Iyah");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Utama 7", description: "Cihuy", buttonText: "Iyah", buttonColor: Colors.redAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Makanan Utama 7", "Iyah");}),
    ]);
  }

  void loadpopular() {
    popularitem.addAll([
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Pop 1", description: "Populer", buttonText: "Nggih", buttonColor: Colors.greenAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Populer", "Populer");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Pop 2", description: "Populer", buttonText: "Nggih", buttonColor: Colors.greenAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Populer", "Populer");}),
      CustomListItem(image: "lib/drawable/Logo.png", title: "Ini makanan Pop 3", description: "Populer", buttonText: "Nggih", buttonColor: Colors.greenAccent, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/Logo.png", "Populer", "Populer");}),
    ]);
  }

  void removeFromOrders(int index) {
    if (index >= 0 && index < orderitem.length) {
      orderitem.removeAt(index);
    } else {
      print("Invalid index: $index"); // Debugging purpose
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