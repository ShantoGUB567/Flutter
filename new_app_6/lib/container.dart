import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerActivity extends StatelessWidget{
  const ContainerActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container Layout"),),
      body: Container(
        height: 120,
        width: 250,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsets.only(left: 20, right: 10, top: 30),
        color: Color(0xFF42A5F5),
        child: Text("Al Shahriar Ahommed Shanto"),
      ),
    );
  }
  
}