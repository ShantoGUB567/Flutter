import 'package:flutter/material.dart';

class todo_app extends StatefulWidget {
  const todo_app({super.key});

  @override
  State<todo_app> createState() => _todo_appState();
}

class _todo_appState extends State<todo_app> {

  TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  List<String> tasks= ["T1", "T2"];

  _addTask(){
    String task = taskController.text;
    setState(() {
      tasks.add(task);
    });
    taskController.clear();
  }

  _deleteTask(index){
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),),
        backgroundColor: Colors.grey,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input Task",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add_task),
                  onPressed: (){_addTask();},
                ),
              ),
              controller: taskController,
            ),
          ),

          Text(
            "Task List",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: IconButton(
                      onPressed: (){_deleteTask(index);},
                      icon: Icon(Icons.delete)
                  ),
                );
              },

            ),
          )
        ],
      ),
    );
  }
}
