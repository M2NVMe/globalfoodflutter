import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlisticonbutton.dart';
import 'package:globalfoodflutter/Reuses/foodlistnobutton.dart';

class datascontroller extends GetxController {
  var homeitems = <CustomListItem>[].obs;
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
      CustomListItem(image: "lib/drawable/fotomakanan/bolu.png", title: "Bolu pandan", description: "Rp. 10,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/bolu.png", "Bolu pandan", "Rp. 10,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/cendol.jpg", title: "Cendol", description: "Rp. 5,000 -- Regular cup", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/cendol.jpg", "Cendol", "Rp. 5,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/pizza1.jpg", title: "Pizza", description: "Rp. 25,000 -- Plate size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/pizza1.jpg", "Pizza", "Rp. 25,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/burger1.jpg", title: "Burger", description: "Rp. 15,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/burger1.jpg", "Burger", "Rp. 15,000");}),
    ]);
  }

  void loadmenuitems() {
    menuitems.addAll([
      CustomListItem(image: "lib/drawable/fotomakanan/burger1.jpg", title: "Burger", description: "Rp. 15,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/burger1.jpg", "Burger", "Rp. 15,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/spaget1.jpg", title: "French Fries", description: "Rp. 13,000 -- Bolognese", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/spaget1.jpg", "Spaghetti", "Rp. 13,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/cendol.jpg", title: "Cendol", description: "Rp. 5,000 -- Regular cup", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/cendol.jpg", "Cendol", "Rp. 5,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/bolu.png", title: "Bolu pandan", description: "Rp. 10,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/bolu.png", "Bolu pandan", "Rp. 10,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/belgiumfries.png", title: "French fries", description: "Rp. 9,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/belgiumfries.png", "French fries", "Rp. 9,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/pizza1.jpg", title: "Pizza", description: "Rp. 25,000 -- Plate size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/pizza1.jpg", "Pizza", "Rp. 25,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/icecream1.jpg", title: "Es Krim", description: "Rp. 5,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/icecream1.jpg", "Es krim", "Rp. 5,000");}),
    ]);
  }

  void loadpopular() {
    popularitem.addAll([
      CustomListItem(image: "lib/drawable/fotomakanan/burger1.jpg", title: "Burger", description: "Rp. 15,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/burger1.jpg", "Burger", "Rp. 15,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/pizza1.jpg", title: "Pizza", description: "Rp. 25,000 -- Plate size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/pizza1.jpg", "Pizza", "Rp. 25,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/bolu.png", title: "Bolu pandan", description: "Rp. 10,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/bolu.png", "Bolu pandan", "Rp. 10,000");}),
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