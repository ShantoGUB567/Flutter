import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBarAct extends StatelessWidget {
  const ButtonBarAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ButtonBar & TextField Activity"),),
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent, width: 5,),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.merge(BorderSide(width: 0.2, ), BorderSide(width: 1)),
                  ),
                  filled: true,
                  labelText: "Enter Name"
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Enter Student ID",
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28)
                  ),
                  filled: true,
                  labelText: "Enter Email"
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Whatsapp Number",
                ),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Submit")),
                  ElevatedButton(onPressed: () {}, child: Text("Reset")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}