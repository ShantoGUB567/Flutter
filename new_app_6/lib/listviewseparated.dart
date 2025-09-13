import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Separated"),),
      body: ListView.separated(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Person ${index + 1}"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.call),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 40, child: Text("Separator $index"),);
        },
      ),
    );
  }
}