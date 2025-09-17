import 'package:flutter/material.dart';
import 'package:new_app_6/align.dart';
import 'package:new_app_6/appbar.dart';
import 'package:new_app_6/card.dart';
import 'package:new_app_6/clipRect.dart';
import 'package:new_app_6/column.dart';
import 'package:new_app_6/expanded.dart';
import 'package:new_app_6/flex.dart';
import 'package:new_app_6/flexible.dart';
import 'package:new_app_6/indexedStack.dart';
import 'package:new_app_6/listview.dart';
import 'package:new_app_6/listviewbuilder.dart';
import 'package:new_app_6/listviewcustom.dart';
import 'package:new_app_6/listviewseparated.dart';
import 'package:new_app_6/singlescrollview.dart';
import 'package:new_app_6/spacer.dart';
import 'package:new_app_6/stack.dart';

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
      body: Row(
        children: [
          Column(
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
                  child: Text("Card & Sizebox")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScrollViewActivity()));
                  },
                  child: Text("ScrollView")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => App_Bar()));
                  },
                  child: Text("AppBar")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewAct()));
                  },
                  child: Text("ListView")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewBuilder()));
                  },
                  child: Text("ListView 1")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewSeparated()));
                  },
                  child: Text("ListView 2")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewCustom()));
                  },
                  child: Text("ListView 3")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StackAct()));
                  },
                  child: Text("Stack")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("IndexedStack")
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClipRectAct()));
                  },
                  child: Text("ClipRect")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("ClipRRect")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("ClipOval")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("ClipPath")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("IndexedStack")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("IndexedStack")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("IndexedStack")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("IndexedStack")
              ),ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IndexedStackAct()));
                  },
                  child: Text("IndexedStack")
              ),
            ],
          ),
          Column(
            children: [
              Text("Shanto"),
            ],
          ),
        ],
      ),
    );
  }
}



