import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnActivity extends StatelessWidget {
  const ColumnActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Column Activity"),),
      body: Container(
        color: Colors.yellowAccent,
        height: double.infinity,
        width: 300,
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          // mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          verticalDirection: VerticalDirection.up,
          spacing: 20,
          textBaseline: TextBaseline.ideographic,
          children: [
            Container(height: 100, width: 200, color: Colors.blue[700], child: Text("Al"),),
            Container(height: 100, width: 200, color: Colors.blue[500], child: Text("Shahriar"),),
            Container(height: 100, width: 200, color: Colors.blue[300], child: Text("Ahommed"),),
            Container(height: 100, width: 200, color: Colors.blue[100], child: Text("Shanto"),),
          ],
        ),
      ),
    );
  }
}