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

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Row(
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Click Me"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Cancel"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text("Save"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                DropdownButton<String>(
                  value: "One",
                  items: ["One", "Two", "Three"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {},
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text("Option 1")),
                    PopupMenuItem(child: Text("Option 2")),
                  ],
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Text("iOS Button"),
                ),

              ],
            ),

            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("pressed");
                  },
                  onLongPress: () {
                    print("long pressed");
                  },
                  child: Text("Elevated Button"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.yellow, 
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30), 
                          topRight: Radius.circular(30), 
                        bottomRight: Radius.elliptical(20, 10)
                      ),
                    ),
                    elevation: 10,
                    minimumSize: Size(150, 80),
                    side: BorderSide(color: Colors.blueAccent, width: 5,),
                  ),
                  autofocus: true,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Text Button"),
                  style: TextButton.styleFrom(
                    elevation: 20,
                    side: BorderSide(width: 2)
                  ),
                ), 
                OutlinedButton(
                  onPressed: () {},
                  child: Text("Outline Button"),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                  ), 
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.access_alarm),
                  hoverColor: Colors.blueAccent,
                  tooltip: "Alarm",
                  splashRadius: 50,
                  splashColor: Colors.redAccent,
                  highlightColor: Colors.greenAccent,
                  focusColor: Colors.yellowAccent,
                  alignment: Alignment.topLeft,
                ), 
                Image.network(
                  "https://gucc.green.edu.bd/_next/image?url=%2Fevents%2F53.jpg&w=3840&q=75",
                  fit: BoxFit.fitWidth,
                  color: Colors.green[400],
                  colorBlendMode: BlendMode.darken,
                  height: 200,
                  width: 250,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}