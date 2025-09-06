import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexibleActivity extends StatelessWidget {
  const FlexibleActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flexible Activity"),),
      body: Column(
        children: [
          Flexible(flex: 2 ,child: Container(height: 500 , color: Colors.green,)),
          Flexible(flex: 1 ,child: Container(height: 800 , color: Colors.red,)),
          Flexible(fit: FlexFit.tight, flex: 3 ,child: Container(height: 200 , color: Colors.blue,)),
          Row(
            children: [
              Flexible(
                fit: FlexFit.loose, // নিজের size অনুযায়ী থাকবে
                flex: 2,
                child: Container(width: 400, height: 50, color: Colors.red),
              ),
              Flexible(
                fit: FlexFit.tight, // জোর করে বাকি সব জায়গা নিবে
                flex: 1,
                child: Container(height: 50, color: Colors.green),
              ),
            ],
          )

        ],
      ),
    );
  }
}