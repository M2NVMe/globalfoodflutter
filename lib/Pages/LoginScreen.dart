import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalfoodflutter/Pages/Controllers/LoginControl.dart';
import 'package:globalfoodflutter/Reuses/myButton.dart';
import 'package:globalfoodflutter/Reuses/myTextfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControl loginController = Get.put(LoginControl());
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("lib/drawable/Logo.png"),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: myTextField(
                height: 42,
                width: 350,
                hintText: "Username",
                hintstyle: TextStyle(fontSize: 12.5),
                isObscure: false,
                textStyle: TextStyle(fontFamily: "Lexend", color: Colors.black87),
                rad: 6,
                onchange: (String value) {
                  loginController.usr.value = value;
                },
                keytype: TextInputType.text,
                fillcolor: Color.fromARGB(255, 217, 217, 217),
                filled: true,
                borderColor: Color.fromARGB(255, 217, 217, 217),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: myTextField(
                height: 42,
                width: 350,
                hintText: "Password",
                hintstyle: TextStyle(fontSize: 12.5),
                isObscure: true,
                textStyle: TextStyle(fontFamily: "Lexend", color: Colors.black87),
                rad: 6,
                onchange: (String value) {
                  loginController.pws.value = value;
                },
                keytype: TextInputType.text,
                fillcolor: Color.fromARGB(255, 217, 217, 217),
                filled: true,
                borderColor: Color.fromARGB(255, 217, 217, 217),
              ),
            ),
            SizedBox(height: 20,),
            myButton(
              textButton: Text("Login"),
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              radius: 8,
              elevation: 0,
              onPressed: () {
                loginController.login(); // Use existing instance
              },
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
