import 'dart:io';

import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/myButton.dart';
import 'package:get/get.dart';

class profileFragment extends StatelessWidget {
  const profileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 0),
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: width,
                height: 280,
                color: Color.fromARGB(200, 194, 194, 194),
                child: Center(
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      Image.asset(
                        "lib/drawable/Logo.png",
                        height: 130,
                        width: 130,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Bagus Wiraguna",
                        style: TextStyle(fontFamily: "Lexend", fontSize: 18),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            )),
            Expanded(child: Container()),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centers the children horizontally
                children: [
                  Icon(Icons.mail_outline, size: 40),
                  SizedBox(width: 30),
                  Text("m2sjmail@gmail.com", style: TextStyle(fontFamily: "Lexend", fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 15), // Use SizedBox instead of Container for spacing
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centers the children horizontally
                children: [
                  Icon(Icons.phone, size: 40),
                  SizedBox(width: 30),
                  Text("085229921536", style: TextStyle(fontFamily: "Lexend", fontSize: 20)),
                ],
              ),
            ),

            Expanded(child: Container()),
            SizedBox(
                width: 300,
                child: myButton(
                    textButton: Text("Logout"),
                    backgroundColor: Colors.blueGrey,
                    textColor: Colors.white,
                    radius: 8,
                    elevation: 0,
                    onPressed: () {exit(0);})),
            Container(height: 70,),
          ],
        ),
      ),
    );
  }
}
