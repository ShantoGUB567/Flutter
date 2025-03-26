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
   HomeActivity({super.key});
  
  MySnackBar(massage, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(massage))
    );
  }

   ButtonStyle buttonStyle=ElevatedButton.styleFrom(
    padding: EdgeInsets.all(30),
    backgroundColor: Colors.blue
  ); //kaj kortece na

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

    
    body: Container(
      // height: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 210,
                color: Colors.grey,
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(children: [Text("Internet")],),
                        Row(children: [Text("Minute")],),
                        Row(children: [Text("SMS")],),
                      ],
                    ),
                    Column(

                    ),
                  ],
                ),
              )
            ],
          ),

          Row(),
          Row(),
          Row(
            children: [
              Expanded(
                flex: 4,
                  child: Container(
                    height: 100,
                  color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Text("Text-1"))),
              Expanded(
                  flex: 2,
                  child: Container(
                      height: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text("Text-1"))),
              Expanded(
                  flex: 2,
                  child: Container(
                      height: 100,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text("Text-1"))),

            ],
          ),
          
          Row(
            children: [
              TextButton(onPressed: (){MySnackBar("This is Text Button", context);}, child: Text("Text Button")),
              OutlinedButton(onPressed: (){MySnackBar("This is Outline Button", context);}, child: Text("Outline Button")),
              ElevatedButton(onPressed: (){MySnackBar("This is Elevated Button", context);}, child: Text("Elevated Button")),
            ],
          ),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.lightGreenAccent,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  color: Colors.amberAccent,
                ),
              ),

            ],
          ),

          Row(children: [Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center ,
              children: [
                Container(height: 160, width: 160, color: Colors.pink,),
                Container(height: 140, width: 140, margin: EdgeInsets.all(10), color: Colors.teal,),
              ],
            ),
          )],),

        ],
      ),
    ),
    
    
    
    
    //   body: (
    //   Container(
    //     color: Colors.amberAccent,
    //     child: Container(
    //       margin: EdgeInsets.all(10),
    //       color: Colors.purpleAccent,
    //       child: Row(
    //         children: [
    //           // Row(
    //           //
    //           // ),
    //           // Row(),
    //           // Row(),
    //
    //           Container(
    //             color: Colors.green,
    //             margin: EdgeInsets.all(10),
    //             child: Row(
    //               //Row-1
    //             ),
    //           ),
    //
    //           Container(
    //             color: Colors.blue,
    //             margin: EdgeInsets.all(10),
    //             child: Row(
    //               //Row-2
    //             ),
    //           ),
    //
    //           Container(
    //             color: Colors.red,
    //             margin: EdgeInsets.all(10),
    //             child: Row(
    //               //Row-3
    //             ),
    //           ),
    //
    //           Container(
    //             color: Colors.yellow,
    //             margin: EdgeInsets.all(10),
    //             child: Row(
    //               //Row-1
    //             ),
    //           ),
    //
    //         ],
    //       ),
    //     )
    //
    //   )
    //
    //
    // //       Container(
    // //       height: 100,
    // //       color: Colors.lightBlueAccent,
    // //       margin: EdgeInsets.all(20),
    // //   padding: EdgeInsets.all(10),
    // //   child: Row(
    // //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // //     children: [
    // //       Column(
    // //         mainAxisAlignment: MainAxisAlignment.center,
    // //         crossAxisAlignment: CrossAxisAlignment.center,
    // //         children: [
    // //           Icon(Icons.call, size: 50,),
    // //           Text("Call")
    // //         ],
    // //       ),
    // //
    // //       Column(
    // //         mainAxisAlignment: MainAxisAlignment.center,
    // //         crossAxisAlignment: CrossAxisAlignment.center,
    // //         children: [
    // //           Icon(Icons.route, size: 50,),
    // //           Text("Route")
    // //         ],
    // //       ),
    // //
    // //       Column(
    // //         mainAxisAlignment: MainAxisAlignment.center,
    // //         crossAxisAlignment: CrossAxisAlignment.center,
    // //         children: [
    // //           Icon(Icons.share, size: 50,),
    // //           Text("Share")
    // //         ],
    // //       ),
    // //
    // //     ],
    // //   ),
    // //
    // // ),
    //
    //
    //   ),

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

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black54),
                  accountName: Text("Al Shahrair Ahommed Shanto"),
                  accountEmail: Text("shahriarshanto@gmail.com"),
                  // currentAccountPicture: Image(image: Image.asset('assets/221002567.jpg')),
                ),
            ),
            ListTile(leading: Icon(Icons.home) ,title: Text("Home"), onTap: (){MySnackBar("Home Drawer", context);},),
            ListTile(leading: Icon(Icons.dashboard) ,title: Text("Dash Board"), onTap: (){MySnackBar("Dash Board Drawer", context);},),
            ListTile(leading: Icon(Icons.more) ,title: Text("About"), onTap: (){MySnackBar("About Drawer", context);},),
          ],
        ),
      ),

      endDrawer: Drawer(),


    );
  }
}