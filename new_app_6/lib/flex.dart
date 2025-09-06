import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexActivity extends StatelessWidget {
  const FlexActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flex Activity"),),
      body: Column(
        spacing: 20,
        children: [
          Expanded( flex: 1,
            child: Flex(
              spacing: 10,
              direction: Axis.horizontal,
              children: [
                Container(
                  width: 200,
                  height: 120,
                  color: Colors.green,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 120,
                  color: Colors.green,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded( flex: 2,
            child: Flex(
              spacing: 10,
              direction: Axis.vertical,
              children: [
                Container(
                  width: 200,
                  height: 120,
                  color: Colors.green,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 120,
                  color: Colors.green,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible( flex: 2,
            child: Center(
              widthFactor: 2,
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