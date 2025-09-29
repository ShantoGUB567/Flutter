import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipRectAct extends StatelessWidget {
  const ClipRectAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ClipRect Activity")),
      body: Center(
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          child: Image.asset(
            "images/IMG_20250801_145053.jpg",
            width: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white60,
        elevation: 50,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Column(
                children: [
                  Image.asset(
                    "images/IMG_20250801_145053.jpg",
                    width: 80,
                    height: 100,
                  ),
                  Text("Al Shahriar Ahommed Shanto"),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                ),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.account_box),
                ),
                ListTile(
                  title: Text("Shop Now"),
                  leading: Icon(Icons.shopping_cart),
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.logout),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
