import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginActivity(),
    );
  }
}

class LoginActivity extends StatelessWidget {
  const LoginActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container( 
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo1.jpg",
                  height: 80,
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Maintenance",
                      style: TextStyle(fontSize: 25, fontFamily: "Medium", ),
                    ),
                    Text(
                      "Box",
                      style: TextStyle(fontSize: 25, fontFamily: "Medium", color: Color(0xffF9703B)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25,),
            Text(
              "Log in",
              style: TextStyle(fontSize: 25, fontFamily: "Medium", color: Color(0xff2D3142)),
            ),
            SizedBox(height: 15,),
            Text(
              "Lorem ipsum is placeholder text \ncommonly used in the graphic",
              style: TextStyle(fontSize: 16, fontFamily: "Regular", color: Color(0xff2D3142)),
            ),
            SizedBox(height: 35,),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      filled: true,
                      fillColor: Color(0xffE7E7E7),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffB6B6B6), width: 2)
                      )
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Color(0xffE7E7E7),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffB6B6B6), width: 2)
                        )
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: "*",

                  ),
                ],
              ),
            ),
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () {
                  print("Log in");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF9703B),
                elevation: 6,
                shadowColor: Color(0xffF9703B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))
                )
              ),
              child:
              Container(
                height: 60,
                width: 280,
                alignment: Alignment.center,
                child: Text("LOG IN",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Medium"),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 18, fontFamily: "Regular", color: Color(0xff2D3142)),
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, fontFamily: "Regular", color: Color(0xffF9703B)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
