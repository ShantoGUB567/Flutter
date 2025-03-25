import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
return MaterialApp(
      color: Colors.greenAccent,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light
      ) ,
      darkTheme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
      home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App"), backgroundColor: Colors.greenAccent,),
      body: Text("Wellcome to the App"),

    );
  }
}