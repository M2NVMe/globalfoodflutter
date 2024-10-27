import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlistsquare.dart';
import 'package:globalfoodflutter/datas/DatasController.dart';
import 'package:get/get.dart';

class Hometablet extends StatelessWidget {
  const Hometablet({super.key});

  @override
  Widget build(BuildContext context) {
    final datascontroller datas = Get.put(datascontroller());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 35,),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Colors.grey[300],
                      height: 250,
                      child: Image.asset(
                        'lib/drawable/Welcome.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // Description
                  Text(
                    "GlobalFood is an award-winning cloud kitchen provider. With excellent food and service, we guarantee that our food is great and of high quality.",
                    style: TextStyle(fontFamily: "Lexend", fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            SizedBox(width: 40), // Space between the columns
            // Right Side (Recommendations and List)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: datas.homeitems.length,
                        itemBuilder: (context, index) {
                          final item = datas.homeitems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          ],
        ),
      ),
    );
  }
}
