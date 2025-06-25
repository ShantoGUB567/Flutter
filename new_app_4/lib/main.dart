import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_app_4/task_list_page.dart';
import 'package:new_app_4/todo_list.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeActivity(),
      // home: TaskListPage(),
      home: todo_app(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  TextEditingController serchController = TextEditingController();

  @override
  void dispose() {
    serchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task List"),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: (){print("Submit Button Clicked");}, child: Text("Submit")),
            TextButton(onPressed: (){print("Cancel Button Clicked");}, child: Text("Cancel")),
            IconButton(onPressed: (){print("Add Button Clicked");}, icon: Icon(Icons.add)),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: serchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search",
                  suffixIcon: Icon(Icons.search)
                ),
                // onSubmitted: (value){
                //   print("Search Text: $value");
                // },
                // onChanged: (value){
                //   print("Search Text: $value");
                // },
              ),
            ),

            ElevatedButton(
                onPressed: (){
                  if(serchController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please Enter Some Text"))
                    );
                  }
                  log(serchController.text);
                  },
                child: Text("Submit")
            ),
          ],
        ),
    );
  }
}
