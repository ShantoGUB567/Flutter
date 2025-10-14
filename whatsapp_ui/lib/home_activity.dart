import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp",),
          backgroundColor: Colors.teal,
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Icon(Icons.camera_alt)),
              Tab(child: Text("Chats")),
              Tab(child: Text("Status")),
              Tab(child: Text("Call")),
            ],
          ),
          actions: [
            Icon(Icons.search, size: 30,),
            SizedBox(width: 10,),
            PopupMenuButton(
              icon: Icon(Icons.more_horiz, size: 30,),
                itemBuilder: (context,) => [
                  PopupMenuItem(
                    child: Text("New Group"),
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                  ),
                  PopupMenuItem(
                    child: Text("Linked Device"),
                  ),
                ]
            ),
            SizedBox(width: 10,),
          ],
          elevation: 8,
          shadowColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            Text("Camera"),
            ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("Shahriar Shanto"),
                  subtitle: Text("Hi!!  \nWho are you bro??"),
                  leading: CircleAvatar(child: Icon(Icons.person_4, size: 30,),),
                  trailing: Text("03:47 am"),
                );
              }
            ),
            Text("Status"),
            Text("Calls"),
          ],
        ),
      ),
    );
  }
}
