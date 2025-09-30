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
                  labelText: "Enter Name",
                  labelStyle: TextStyle(color: Colors.indigo),
                  icon: Icon(Icons.person)
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Enter Student ID",
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers)
                ),
                maxLength: 9,
                maxLengthEnforcement: null,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                // enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)
                  ),
                  filled: true,
                  labelText: "Enter Email", 
                  suffixIcon: Icon(Icons.email),
                  suffixText: "@gmail.com",
                ),
                cursorColor: Colors.pink,
                cursorWidth: 10,
                // showCursor: false,

              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Whatsapp Number",
                  hintText: "01XXXXXXXXX",
                  helperText: "Phone Number",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: "Password",
                  filled: true,
                ),
                obscureText: true,
                obscuringCharacter: "@",
                toolbarOptions: ToolbarOptions(
                  copy: true,
                  selectAll: true,
                  paste: false,
                  cut: true,
                ),
              ),
              Divider(
                height: 50,
                thickness: 5,
                color: Colors.brown,
                indent: 10,
                endIndent: 10,
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