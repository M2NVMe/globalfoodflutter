import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlisticonbutton.dart';
import 'package:globalfoodflutter/Reuses/myButton.dart';
import 'package:globalfoodflutter/datas/DatasController.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/datas/newLocalDatabasethingamajig.dart';

class ordersFragment extends StatelessWidget {
  const ordersFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseHelper datas = Get.put(DatabaseHelper());

    // Ensure orders are loaded when the fragment is first built
    datas.loadOrders();

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Your Orders",
                style: TextStyle(fontFamily: "Lexend", fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Obx(() {
                  return ListView.builder(
                    itemCount: datas.orders.length,
                    itemBuilder: (context, index) {
                      final item = datas.orders[index];

                      // Ensure that the map contains all keys before accessing them
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                        child: Foodlisticonbutton(
                          image: item['image'] ?? '', // Use null-aware operators
                          title: item['title'] ?? '',
                          description: item['description'] ?? '',
                          buttonColor: Colors.redAccent,
                          onButtonPressed: () {
                            if (item['id'] != null) {
                              datas.deleteOrder(item['id']); // Ensure ID is not null
                            }
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Accepted payment type:", style: TextStyle(fontFamily: "Lexend")),
                      Text("Cash Only", style: TextStyle(fontFamily: "Lexend")),
                    ],
                  ),
                  SizedBox(width: 90),
                  myButton(
                    textButton: Text("Pay"),
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    radius: 6,
                    elevation: 0,
                    onPressed: () => datas.clearOrders(),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
