import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackAct extends StatelessWidget {
  const StackAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack"),),
      body: Center(
        child: Stack(
          // fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 300,
              height: 500,
              color: Colors.blue,
            ),
            Container(
              width: 250,
              height: 400,
              color: Colors.lightGreen,
            ),
            Positioned(
              top: -20,
              right: 30,
              child: Container(
                width: 170,
                height: 300,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}