import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Custom"),),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text("data"),
              );
            }
        ),
      ),
    );
  }
}