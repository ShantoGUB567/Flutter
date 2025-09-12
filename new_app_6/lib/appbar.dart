import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget {
  const App_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GUCC", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.w800),),
        centerTitle: true,
        // leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
          Icon(Icons.shopping_cart),
        ],
        backgroundColor: Colors.teal,
        elevation: 10,
        shadowColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // flexibleSpace: Image.network("https://gucc.green.edu.bd/_next/image?url=%2Fevents%2F53.jpg&w=3840&q=75", fit: BoxFit.cover,),
        toolbarHeight: 50,
        toolbarTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        automaticallyImplyLeading: true,
      ),
    );
  }
}