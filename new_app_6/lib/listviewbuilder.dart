import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Builder"),),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Person ${index + 1}"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.call),
          );
        },
      ),
    );
  }
}