import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Arithmetic Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Simple Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget createButton(String title) {
    return (
      ButtonTheme(
                      child: OutlineButton(
                        onPressed: null,
                        child:Text(title))
                    )
    );
  }

  Widget createRow(String a, String b, String c, String d) {
    return (
      Row(children: <Widget>[
                  createButton(a),
                  createButton(b),
                  createButton(c),
                  createButton(d)
        ])
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container( //top part 
              child: Text('0'
              ),
            ),
            Column( //buttons
              children: <Widget>[
                createRow('+','-','*','/'),
                createRow('7','8','9','0'),
                createRow('6','5','4','AC'),
                createRow('1','2','3','='),
              ]
           )
          ]
        ),
      )
    ); 
  }
}
