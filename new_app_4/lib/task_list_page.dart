import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {

  List<String> tasks = ["Shanto", "Robin", "Shamim", "Pranto", "Imam"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(tasks[index]),
          );
        },
      ),
    );
  }
}
