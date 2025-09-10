import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollViewActivity extends StatelessWidget {
  const ScrollViewActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SingleChildScrollView & Padding & Placeholder"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // reverse: true,
        physics: PageScrollPhysics(),
        // controller: _controller,
        child: Column(
          children: [
            Container(
              height: 500,
              width: 400,
              color: Colors.blue[300],
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Text Widget",
                    textAlign: TextAlign.left,
                    textScaleFactor: 2,
                  ),
                  Text(
                    "onek kico likhte hobe jeno pura box vore jay tai onek kico likhteci. kintu ki likhteci tar age-matha kicoi jani na. janleo buji na. aita hoilo akta pinik",
                    // textAlign: TextAlign.justify,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    // softWrap: true,
                    semanticsLabel: "piniker kotha",
                    selectionColor: Colors.yellowAccent,
                    // strutStyle: StrutStyle(
                    //   fontSize: 30,
                    //   height: 1,
                    //   leading: 1
                    // ),
                    // textHeightBehavior: TextHeightBehavior(
                    //   applyHeightToFirstAscent: true,
                    //   applyHeightToLastDescent: true,
                    //   leadingDistribution: TextLeadingDistribution.even
                    // ),
                    textWidthBasis: TextWidthBasis.longestLine,
                    textScaler: TextScaler.linear(1.5),
                  ),
                  Text(
                    "বাংলা টেক্সট",
                    locale: Locale('bn', 'BD'),
                  ),
                  Text(""),
                  Text(
                    "onek kico likhte hobe jeno pura box vore jay tai onek kico likhteci. kintu ki likhteci tar age-matha kicoi jani na. janleo buji na. aita hoilo akta pinik",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      wordSpacing: 10,
                      decoration: TextDecoration.lineThrough,
                      
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              width: 400,
              color: Colors.green[300],
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(height: 100, color: Colors.teal[600],),
                  Placeholder(
                    color: Colors.blue,
                    strokeWidth: 10,
                    fallbackHeight: 200,
                    fallbackWidth: 300,
                  ),
                  Container(height: 100, color: Colors.teal[600],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}