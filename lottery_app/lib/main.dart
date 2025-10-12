import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Random random = Random();
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Lottery App"),backgroundColor: Colors.teal,),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Lottery Winning Number is 50",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.all(20),
                height: 230,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(
                  //   width: 5,
                  //   color: Colors.black,
                  // )
                ),
                child:
                x > 50 ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.celebration,
                      color: Colors.teal,
                      size: 50,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Congratulations! \nYou are Win \nYour number is $x \nTry Again",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                  ],
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Better luck next time \nYour number is $x \nTry Again",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                  ],
                ) ,

              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = random.nextInt(100);
            print(x);
            setState(() {

            });
          },
          child: Icon(Icons.refresh_rounded, color: Colors.teal,),
        ),
      ),
    );
  }
}
