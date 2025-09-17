import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexedStackAct extends StatelessWidget {
  const IndexedStackAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IndexedStack"),),
      body: Center(
        child: IndexedStack(
          index: 1,
          children: [
            Container(height: 200, width: 150, color: Colors.redAccent,),
            Container(height: 200, width: 150, color: Colors.greenAccent,),
            Container(height: 200, width: 150, color: Colors.tealAccent,),
          ],
        ),
      ),
    );
  }
}