import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget {
  const App_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GUCC"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
          Icon(Icons.shopping_cart),
        ],
        backgroundColor: Colors.teal,
      ),
    );
  }
}