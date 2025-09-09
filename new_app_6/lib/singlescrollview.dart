import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollViewActivity extends StatelessWidget {
  const ScrollViewActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SingleChildScrollView & Padding & Placeholder"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // reverse: true,
        physics: PageScrollPhysics(),
        controller: _controller,
        child: Column(
          children: [
            Container(
              height: 500,
              width: 400,
              color: Colors.blue[300],
              margin: EdgeInsets.all(20),
            ),
            Container(
              height: 500,
              width: 400,
              color: Colors.green[300],
              margin: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
  
}