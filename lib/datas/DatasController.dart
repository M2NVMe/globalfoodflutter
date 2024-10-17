import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlisticonbutton.dart';
import 'package:globalfoodflutter/Reuses/foodlistsquare.dart';
import 'package:globalfoodflutter/datas/newLocalDatabasethingamajig.dart';

class datascontroller extends GetxController {
  var homeitems = <CustomListItem>[].obs;
  var menuitems = <CustomListItem>[].obs;
  var popularitem = <CustomListItemSquare>[].obs;
  var orderitem = <Foodlisticonbutton>[].obs;
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadhomeitems();
    loadmenuitems();
    loadpopular();
    dbHelper.loadOrders();
  }

  void loadhomeitems() {
    homeitems.addAll([
      CustomListItem(image: "lib/drawable/fotomakanan/cendol.jpg", title: "Cendol", description: "Rp. 5,000 -- Regular cup", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/cendol.jpg", "Cendol", "Rp. 5,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/bolu.png", title: "Bolu pandan", description: "Rp. 10,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/bolu.png", "Bolu pandan", "Rp. 10,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/burger1.jpg", title: "Burger", description: "Rp. 15,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/burger1.jpg", "Burger", "Rp. 15,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/pizza1.jpg", title: "Pizza", description: "Rp. 25,000 -- Plate size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/pizza1.jpg", "Pizza", "Rp. 25,000");}),
      CustomListItem(image: "lib/drawable/fotomakanan/icecream1.jpg", title: "Es Krim", description: "Rp. 5,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/icecream1.jpg", "Es krim", "Rp. 5,000");}),
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
      CustomListItemSquare(image: "lib/drawable/fotomakanan/burger1.jpg", title: "Burger", description: "Rp. 15,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/burger1.jpg", "Burger", "Rp. 15,000");}),
      CustomListItemSquare(image: "lib/drawable/fotomakanan/pizza1.jpg", title: "Pizza", description: "Rp. 25,000 -- Plate size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/pizza1.jpg", "Pizza", "Rp. 25,000");}),
      CustomListItemSquare(image: "lib/drawable/fotomakanan/bolu.png", title: "Bolu pandan", description: "Rp. 10,000 -- Regular size", buttonText: "Order", buttonColor: Colors.green, buttonTextColor: Colors.white, onButtonPressed: () {addToOrders("lib/drawable/fotomakanan/bolu.png", "Bolu pandan", "Rp. 10,000");}),
    ]);
  }

  void addToOrders(String image, String title, String description) async {
    await dbHelper.addOrder({
      'image': image,
      'title': title,
      'description': description,
    });
    updateOrderItems();
  }

  void updateOrderItems() {
    orderitem.clear();
    for (var order in dbHelper.orders) {
      orderitem.add(Foodlisticonbutton(
        image: order['image'],
        title: order['title'],
        description: order['description'],
        buttonColor: Colors.redAccent,
        onButtonPressed: () => dbHelper.deleteOrder(order['id']),
      ));
    }
  }

  void clearOrders() async {
    await dbHelper.clearOrders();
    updateOrderItems();
  }
}