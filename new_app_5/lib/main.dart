import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: Text("My App"),
              backgroundColor: Colors.greenAccent,
            ),
            body:
            // Column(
            //   children: [
            //     Text(
            //       "data. This text is centered.",
            //       textAlign: TextAlign.center,
            //       textScaleFactor: 1.5,
            //     ),
            //     Text(
            //       'This is a very long text. This is a very long text. This is a very long text. This is a very long text. This is a very long text. This is a very long text.',
            //       maxLines: 1,
            //       overflow: TextOverflow.fade,
            //
            //     ),
            //     Text(
            //       'Wrapping Text',
            //       softWrap: false,
            //       strutStyle: StrutStyle(
            //         fontSize: 20,
            //         height: 2,),
            //     ),
            //     Text(
            //       'Right to Left',
            //       textDirection: TextDirection.ltr,
            //     ),
            //     Text(
            //       '💖',
            //       semanticsLabel: 'Heart Emoji',
            //     ),
            //     Text(
            //       'Selectable Text',
            //       selectionColor: Colors.pink,
            //     ),
            //     Text(
            //       'Stylish Text aro onek kico likhte hobe',
            //       style: TextStyle(
            //         color: Colors.blue,
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //         fontStyle: FontStyle.italic,
            //         letterSpacing: 2.0,
            //         wordSpacing: 4.0,
            //         backgroundColor: Colors.yellow,
            //         decoration: TextDecoration.underline,
            //         decorationColor: Colors.red,
            //         decorationStyle: TextDecorationStyle.dotted,
            //       ),
            //     ),
            //   ],
            // ),
            Column(
              children: [
                // Container(
                //   height: 50,
                //   width: 100,
                //   alignment: Alignment.center,
                //   // color: Colors.redAccent,
                //   margin: EdgeInsets.all(10),
                //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                //   decoration: BoxDecoration(
                //     color: Colors.blueGrey,
                //     border: Border.all(color: Colors.green, width: 3),
                //     borderRadius: BorderRadius.circular(10),
                //     gradient: RadialGradient(colors: [Colors.cyan, Colors.green]),
                //   ),
                //   child: Text("Shanto",),
                // ),
                Container(child: Text(
                  "Al Shahriar",
                  style: TextStyle(fontSize: 20),
                ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.yellowAccent,
                ),
                Container(child: Text(
                  "Ahommed",
                  style: TextStyle(fontSize: 20),
                ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.greenAccent,
                ),
                Container(child: Text(
                  "Shanto",
                  style: TextStyle(fontSize: 20),
                ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                ),
              ],

              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // verticalDirection: VerticalDirection.up,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
            )

          );
    }
  }