import 'package:flutter/material.dart';
import 'package:globalfoodflutter/Reuses/myButton.dart';
import 'package:globalfoodflutter/Reuses/myTextfield.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
              child: myTextField(height: 42,width: 350,hintText: "Username",hintstyle: TextStyle(fontSize: 12.5), isObscure: false, textStyle: TextStyle(fontFamily: "Lexend", color: Colors.black87), rad: 6, controller: usernameController, keytype: TextInputType.text, fillcolor: Color.fromARGB(255, 217, 217, 217), filled: true, borderColor: Color.fromARGB(255, 217, 217, 217),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: myTextField(height: 42,width: 350,hintText: "Password",hintstyle: TextStyle(fontSize: 12.5), isObscure: true, textStyle: TextStyle(fontFamily: "Lexend", color: Colors.black87), rad: 6, controller: passwordController, keytype: TextInputType.text, fillcolor: Color.fromARGB(255, 217, 217, 217), filled: true, borderColor: Color.fromARGB(255, 217, 217, 217),),
            ),
            SizedBox(height: 20,),
            myButton(textButton: "login", backgroundColor: Colors.redAccent, textColor: Colors.white, radius: 8, elevation: 0, onPressed: () {}),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
