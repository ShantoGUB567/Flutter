import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerActivity extends StatelessWidget{
  const ContainerActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container Layout"),),
      body: Container(
        // height: 120,
        // width: 250,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsets.only(left: 20, right: 10, top: 30),
        // color: Color(0xFF42A5F5),
        constraints: BoxConstraints.tight(Size(300,150)),
        // transform: Matrix4.rotationZ(25.0),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          border: Border.all(color: Colors.black, width: 5),
          borderRadius: BorderRadius.circular(50),
        ),

        child: Text("Al Shahriar Ahommed Shanto"),
      ),
    );
  }
  
}