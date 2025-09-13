import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewAct extends StatelessWidget {
  const ListViewAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Default"),),
      body:
    // ListView(
      //   padding: EdgeInsets.all(20),
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     Container(
      //       height: 200,
      //       color: Colors.redAccent,
      //     ),Container(
      //       height: 200,
      //       color: Colors.greenAccent,
      //     ),Container(
      //       height: 200,
      //       color: Colors.blue,
      //     ),Container(
      //       height: 200,
      //       color: Colors.yellowAccent,
      //     ),Container(
      //       height: 200,
      //       color: Colors.pinkAccent,
      //     ),
      //   ],
      // ),
      ListView(
        children: [
          ListTile(
            title: Text("Shanto"),
            subtitle: Text("221002567"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.call),
            contentPadding: EdgeInsets.all(20),
            onTap: () { },
            selected: true,
            selectedTileColor: Colors.blue[100],

          ),
        ],
      ),
    );
  }
}