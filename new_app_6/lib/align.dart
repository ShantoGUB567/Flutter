import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignActivity extends StatelessWidget {
  const AlignActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Align Activity"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Container(
            color: Colors.red[100],
            height: 150,
            alignment: Alignment.bottomRight,
            child: Container(
              height: 100,
              width: 200,
              color: Colors.blueGrey,
            ),
          ),
          Container(
            color: Colors.red[100],
            height: 150,
            alignment: Alignment(-0.6, 0.3),
            child: Container(
              height: 100,
              width: 200,
              color: Colors.blueGrey,
            ),
          ),
          Container(
            color: Colors.red[100],
            height: 300,
            // alignment: Alignment.bottomRight,
            child: Center(
              widthFactor: 1.5,
              heightFactor: 2,
              child: Container(
                child: Text("Center Widget"),
                height: 100,
                width: 150,
                color: Colors.lightGreenAccent,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

}