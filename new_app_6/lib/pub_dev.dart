import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PubDev extends StatelessWidget {
  const PubDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Use of PubDev"),),
      body: SafeArea(child: Column(
        children: [
          Text("Normal Icons"), 
          Icon(Icons.home),
          Icon(Icons.alarm),
          Text("Cupertino Icons"),
          Icon(CupertinoIcons.home),
          Icon(CupertinoIcons.alarm),
          Text("Font Awesome Icons"),
          Icon(FontAwesomeIcons.bug),
          Icon(FontAwesomeIcons.clock),
        ],
      )),
    );
  }
}
