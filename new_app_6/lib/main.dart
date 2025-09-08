import 'package:flutter/material.dart';
import 'package:new_app_6/align.dart';
import 'package:new_app_6/card.dart';
import 'package:new_app_6/column.dart';
import 'package:new_app_6/expanded.dart';
import 'package:new_app_6/flex.dart';
import 'package:new_app_6/flexible.dart';
import 'package:new_app_6/spacer.dart';

import 'container.dart';
import 'column.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice Text"),),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContainerActivity()));
              },
              child: Text("Container")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ColumnActivity()));
              },
              child: Text("Column")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExpandedActivity()));
              },
              child: Text("Expanded")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FlexibleActivity()));
              },
              child: Text("Flexible")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FlexActivity()));
              },
              child: Text("Flex")
          ),ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AlignActivity()));
              },
              child: Text("Align")
          ),ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SpacerActivity()));
              },
              child: Text("Spacer")
          ),ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CardActivity()));
              },
              child: Text("Card")
          ),ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FlexibleActivity()));
              },
              child: Text("Flexible")
          ),ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FlexibleActivity()));
              },
              child: Text("Flexible")
          ),
        ],
      ),
    );
  }
}



