import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"), backgroundColor: Colors.blueGrey,),

      //For understanding Container Property
      // body: Center(
      //   child: Container(
      //     height: 200,
      //     width: 200,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //         color: Colors.orangeAccent,
      //         border: Border.all(color: Colors.black, style: BorderStyle.solid),
      //         // borderRadius: BorderRadius.circular(20),
      //         boxShadow: [
      //           BoxShadow(
      //             blurRadius: 30,
      //             color: Colors.grey,
      //             spreadRadius: 20,
      //             offset: Offset(20, 20),
      //           )
      //         ] ,
      //       shape: BoxShape.circle,
      //     ),
      //     // constraints: BoxConstraints(),
      //     // transform: Matrix4.rotationX(10.0),
      //     child: Text("Hello Shanto"),
      //   ),
      // ),

      body: Column(
        children: [
          Flexible(child: Container(color: Colors.redAccent, height: 100,)),
          Flexible(flex: 2 , child: Container(color: Colors.yellowAccent, height: 100,)),
          // Spacer(),
          Flexible(child: Container(color: Colors.greenAccent, height: 100,)),
          Center(
            // heightFactor: 10,
            // widthFactor: 5,
            child: Text("Shahriar Shanto"),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text("ki oboshta bro ??"),
          ),

        ],
      ),
    );
  }
}