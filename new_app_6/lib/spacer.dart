import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpacerActivity extends StatelessWidget {
  const SpacerActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spacer Activity"),),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(height: 100, width: 100, color: Colors.blue[900],),
                Spacer(),
                Container(height: 100, width: 100, color: Colors.blue[700],),
                Spacer(flex: 3,),
                Container(height: 100, width: 100, color: Colors.blue[500],),
              ],
            ),
          ),
          // Spacer(flex: 2,),
          Expanded(
            child: Column(
              // direction: Axis.vertical,
              children: [
                Container(height: 100, width: 100, color: Colors.green[900],),
                Spacer(flex: 2,),
                Container(height: 100, width: 100, color: Colors.green[700],),
                Spacer(flex: 1,),
                Container(height: 100, width: 100, color: Colors.green[500],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}