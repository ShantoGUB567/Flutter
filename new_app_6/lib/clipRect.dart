import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipRectAct extends StatelessWidget {
  const ClipRectAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ClipRect Activity"),),
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

        
      ),
      endDrawer: Drawer(),
    );
  }
}