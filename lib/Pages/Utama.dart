import 'package:flutter/material.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ini home"),),
      body: Column(
        children: [
          Text("ini utama")
        ],
      ),
    );
  }
}
