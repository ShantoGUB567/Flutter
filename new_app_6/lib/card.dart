import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardActivity extends StatelessWidget {
  const CardActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card & SizeBox Activity"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 300,
            width: 300,
            // alignment: Alignment.centerLeft,
            // color: Colors.blue,
            child: Card(
              color: Colors.teal,
              elevation: 30,
              shadowColor: Colors.purpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                    color: Colors.blueAccent,
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignInside,
                    style: BorderStyle.solid),
              ),
              margin: EdgeInsets.all(20),
              clipBehavior: Clip.hardEdge,
              borderOnForeground: false,
              // surfaceTintColor: Colors.grey,
              child: Text("Al Shahriar Ahommed Shanto. aro onek kico likhte hobe jeno box er baire chole jay"),
            ),
          ),
          SizedBox(
            height: 200,
            width: 200, 
            child: Card(
              color: Colors.green[300],
            ),
          ),
        ],
      ),
    );
  }
}