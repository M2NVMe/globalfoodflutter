import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlisticonbutton.dart';
import 'package:globalfoodflutter/Reuses/myButton.dart';
import 'package:globalfoodflutter/datas/DatasController.dart';
import 'package:get/get.dart';

class ordersFragment extends StatelessWidget {
  const ordersFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final datascontroller datas = Get.put(datascontroller());
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
                    itemCount: datas.orderitem.length,
                    itemBuilder: (context, index) {
                      final item = datas.orderitem[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                        child: Foodlisticonbutton(
                          image: item.image,
                          title: item.title,
                          description: item.description,
                          icon: item.icon,
                          buttonColor: item.buttonColor,
                          onButtonPressed: () => datas.removeFromOrders(index), // Pass the correct index
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
                    textButton: "Pay",
                    backgroundColor: Colors.greenAccent,
                    textColor: Colors.white,
                    radius: 6,
                    elevation: 0,
                    onPressed: () {},
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}