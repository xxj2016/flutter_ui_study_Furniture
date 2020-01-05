import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));


class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _buildGradientContainer(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfffbfcfd), Color(0xfff2f3f8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1.0]
          )
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: height * .2,
      left: 30.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Wooden Armchair", style: TextStyle(fontSize: 28.0)),
          Text("Loren Ipsem",style: TextStyle(fontSize: 16.0),)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
            var width = constraints.maxWidth;
            var height = constraints.maxHeight;

            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _buildGradientContainer(width, height),
                _buildAppBar(),
                _buildTitle(height),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(height: height * .6,),
                  )
              ],
            );
        },
      )
    );
  }
}