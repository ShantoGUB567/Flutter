import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedActivity extends StatelessWidget{
  const ExpandedActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded Activity"),),
      body: Column(
        spacing: 20,
        children: [
          Expanded(flex: 1 ,child: Container(height: 100 , color: Colors.red,)),
          Expanded(flex: 2 ,child: Container(height: 100 , color: Colors.green,)),
          Expanded(flex: 3 ,child: Container(height: 200 , color: Colors.blue,)),
        ],
      ),
    );
  }
}