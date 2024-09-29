import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/myButton.dart';

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
                        Image.asset("lib/drawable/Logo.png", height: 130, width: 130,),
                        SizedBox(height: 20,),
                        Text("Bagus Wiraguna", style: TextStyle(fontFamily: "Lexend", fontSize: 18),),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
              )
            ),
            Expanded(child: Container()),
            myButton(textButton: Text("Logout"), backgroundColor: Colors.blueGrey, textColor: Colors.white, radius: 8, elevation: 0, onPressed: () {}),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
