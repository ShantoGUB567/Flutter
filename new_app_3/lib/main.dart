import 'package:flutter/material.dart';
// import 'package:flutter_social_button/flutter_social_button.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeActivity()
    );
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  MySnackBar(massage, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(massage))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile UI Design"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),

          Container(
            child:(
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.greenAccent,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/221002567.jpg'),
                ),
              )
            ),
          ),

          SizedBox(height: 10,),

          Column(
            children: [
              Text(
                "Al Shahriar Ahommed Shanto",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Flutter App Developer",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ],
          ),

          SizedBox(height: 20,),

          Row(
            spacing: 40,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Project", style: TextStyle(fontSize: 20),),
                  Text("14", style: TextStyle(fontSize: 25),),
                ],
              ),
              Column(
                children: [
                  Text("Following", style: TextStyle(fontSize: 20),),
                  Text("12k+", style: TextStyle(fontSize: 25),),
                ],
              ),
              Column(
                children: [
                  Text("Award", style: TextStyle(fontSize: 20),),
                  Text("5", style: TextStyle(fontSize: 25),),
                ],
              ),
            ],
          ),

          SizedBox(height: 20,),

          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black38,

            ),
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){MySnackBar("Facebook", context);}, icon: Icon(Icons.facebook)),
              IconButton(onPressed: (){MySnackBar("Instagram", context);}, icon: Icon(Icons.call)),
              IconButton(onPressed: (){MySnackBar("Linkedin", context);}, icon: Icon(Icons.calculate)),
              IconButton(onPressed: (){MySnackBar("Github", context);}, icon: Icon(Icons.facebook)),
            ],
          ),

          SizedBox(height: 20,),

          OutlinedButton(onPressed: (){MySnackBar("View Profile", context);}, child: Text("View Profile")),
        ],
      ),
    );
  }
}