import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlisticonbutton.dart';
import 'package:globalfoodflutter/Reuses/foodlistnobutton.dart';
import 'package:globalfoodflutter/datas/newLocalDatabasethingamajig.dart';

class datascontroller extends GetxController {
  var homeitems = <CustomListItemNobutton>[].obs;
  var menuitems = <CustomListItem>[].obs;
  var popularitem = <CustomListItem>[].obs;
  var orderitem = <Foodlisticonbutton>[].obs;
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadhomeitems();
    loadmenuitems();
    loadpopular();
    loadOrdersFromDatabase();
  }

  void loadhomeitems() {
    homeitems.addAll([
      CustomListItemNobutton(image: "lib/drawable/fotomakanan/burger1.jpg", title: "Burger", description: "Sejenis sandwich yang di beri topping sayur sayuran dan daging sebagai lauknya, rasanya enak dan mudah untuk dikonsumsi"),
      CustomListItemNobutton(image: "lib/drawable/fotomakanan/pizza1.jpg", title: "Pizza", description: "Makanan ikonik dari Italia, bentuknya bulat dan tekstur yang khas"),
      CustomListItemNobutton(image: "lib/drawable/fotomakanan/icecream1.jpg", title: "Es Krim", description: "Makanan ini dingin lho!, sebuah makanan yang terbuat dari campuran susu yang didinginkan, cocok untuk di konsumsi saat cuaca panas"),
      CustomListItemNobutton(image: "lib/drawable/fotomakanan/spaget1.jpg", title: "Spaghetti", description: "Makanan yang menyerupai sebuah mie namun berasal dari Itali, biasanya di campur dengan campuran yang bernama bolognese"),
      CustomListItemNobutton(image: "lib/drawable/fotomakanan/belgiumfries.png", title: "French Fries", description: "Olahan kentang yang dimana kentang tersebut digoreng hingga kering agar menciptakan cita rasa yang crunchy dan di taburi dengan garam untuk menambah rasa"),
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

  void addToOrders(String image, String title, String description) async {
    await dbHelper.insertOrder({
      'image': image,
      'title': title,
      'description': description,
    });

    loadOrdersFromDatabase(); // Refresh the UI with new data from DB
  }

  // Load orders from local database
  void loadOrdersFromDatabase() async {
    List<Map<String, dynamic>> orders = await dbHelper.getOrders();
    orderitem.clear();  // Clear current list
    for (var order in orders) {
      orderitem.add(Foodlisticonbutton(
        image: order['image'],
        title: order['title'],
        description: order['description'],
        icon: Icon(Icons.cancel, color: Colors.white),
        buttonColor: Colors.redAccent,
        onButtonPressed: () => removeFromOrders(order['id']),
      ));
    }
  }

  // Remove order from local database and reload
  void removeFromOrders(int id) async {
    await dbHelper.deleteOrder(id);  // Remove item from DB using its id
    loadOrdersFromDatabase();        // Refresh the UI
  }

  // Clear all orders from local database and reload
  void clearOrders() async {
    await dbHelper.clearOrders();
    loadOrdersFromDatabase();        // Refresh the UI
  }

}