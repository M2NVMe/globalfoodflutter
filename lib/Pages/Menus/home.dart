import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/foodlist.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'lib/drawable/Logo.png', // Replace with your image asset path
                    fit: BoxFit.contain,// Ensures the image covers the entire container
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
                child: ListView.builder(itemCount: datas.homeitems.length,itemBuilder: (context, index) {
                  final item = datas.homeitems[index];
                  return ListTile(
                    leading: Image.asset(item.image),
                    title: Text(item.title),
                    subtitle: Text(item.description),
                  );
                },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
