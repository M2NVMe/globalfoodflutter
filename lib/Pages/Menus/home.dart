import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
import 'package:globalfoodflutter/Reuses/foodlisticonbutton.dart';
import 'package:globalfoodflutter/Reuses/foodlistnobutton.dart';
import 'package:globalfoodflutter/datas/DatasController.dart';
import 'package:get/get.dart';

class homeFragment extends StatelessWidget {
  const homeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final datascontroller datas = Get.put(datascontroller());
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Home",
                style: TextStyle(fontFamily: "Lexend", fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 22),
            Center( // Center the grey container
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners with radius of 8
                child: Container(
                  color: Color.fromARGB(255, 121, 121, 121),
                  width: 355,
                  height: 165,
                  child: Image.asset(
                    'lib/drawable/Welcome.png', // Replace with your image asset path
                    fit: BoxFit.contain, // Ensures the image covers the entire container
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Recommendations",
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
                    itemCount: datas.popularitem.length,
                    itemBuilder: (context, index) {
                      final item = datas.homeitems[index];
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
            ),
          ],
        ),
      ),
    );
  }
}
