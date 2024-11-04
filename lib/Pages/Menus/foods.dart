import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Reuses/foodlistsquare.dart';
import 'package:globalfoodflutter/datas/DatasController.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart'; // Ensure this imports the correct path to `CustomListItem`

class foodsFragment extends StatelessWidget {
  const foodsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final datascontroller datas = Get.put(datascontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Top Seller",
                style: TextStyle(fontFamily: "Lexend", fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
              child: Container(
                height: 270,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Obx(() {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: datas.popularitem.length,
                      itemBuilder: (context, index) {
                        final item = datas.popularitem[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                          child: SizedBox(
                            width: 250,
                            child: CustomListItemSquare(
                              image: item.image,
                              title: item.title,
                              description: item.description,
                              buttonText: item.buttonText,
                              buttonColor: item.buttonColor,
                              buttonTextColor: item.buttonTextColor,
                              onButtonPressed: item.onButtonPressed,
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Our Menu",
                style: TextStyle(fontFamily: "Lexend", fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                  itemCount: datas.menuitems.length,
                  itemBuilder: (context, index) {
                    final item = datas.menuitems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                      child: CustomListItem(
                        image: item.image,
                        title: item.title,
                        description: item.description,
                        buttonText: item.buttonText,
                        buttonColor: item.buttonColor,
                        buttonTextColor: item.buttonTextColor,
                        onButtonPressed: item.onButtonPressed,
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
