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
  
  MySnackBar(massage, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(massage))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        titleSpacing: 10,
        // centerTitle: true,
        toolbarHeight: 60, //Default size= 60
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.greenAccent,

        actions: [
          IconButton(onPressed: (){MySnackBar("This is Comment Icon", context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackBar("This is Search Icon", context);}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){MySnackBar("This is Settings Icon", context);}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){MySnackBar("This is Facebook Icon", context);}, icon: Icon(Icons.facebook)),
          IconButton(onPressed: (){MySnackBar("This is Email Icon", context);}, icon: Icon(Icons.email)),
        ],
      ),

      body: (
        Container(
          height: 100,
          color: Colors.lightBlueAccent,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.call, size: 50,),
                  Text("Call")
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.route, size: 50,),
                  Text("Route")
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.share, size: 50,),
                  Text("Share")
                ],
              ),

            ],
          ),

        )
      ),



      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
        onPressed: (){
          MySnackBar("This is Floating Action Button", context);
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,  // 0=home, 1=contact, 2=profile
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_emergency), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index){
          if(index==0){
            MySnackBar("Home Tab", context);
          }
          if(index==1){
            MySnackBar("Contact Tab", context);
          }
          if(index==2){
            MySnackBar("Profile Tab", context);
          }

        },
      ),

    );
  }
}