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

  String displayString = '0';
  String numberString  = '0';
  double result        = 0;
  String operation;
  bool shouldCalculate = false;

  pressButton(String title) {
    setState(() {
      if(title =='+'|| title =='-'|| title =='*'|| title =='/') {
        if(shouldCalculate) {
          calculate();
        }else {
          result = double.parse(numberString) ?? 0;
          shouldCalculate = true;
        }        
        numberString = '';
        operation = title;
      }else if(title == '=') {
        calculate();
        shouldCalculate = false;
      }else if(title == 'AC') {
        numberString = '';
        displayString = '0';
        result = 0;
        shouldCalculate = false;
      }else {
        if(numberString == '0' || numberString == '0.0') {
            numberString = '';
        }
        numberString += title;
        displayString =numberString;
      }
    });
  }

  calculate() {
    switch (operation) {
      case '+':
        result +=double.parse(numberString);
        break;
      case '-':
        result -=double.parse(numberString);
        break;
      case '/':
        result /=double.parse(numberString);
        break;
      case('*'):
        result *=double.parse(numberString);
        break;
      default:
        break;
    }
    numberString = result.toString();
    displayString = numberString;
  }

  Widget createButton(String title) {
    return Expanded(
          child: (
        ButtonTheme(    height: double.infinity,
                        child: OutlineButton(
                          onPressed: () => pressButton(title),
                          color:Colors.black12,
                          hoverColor: Colors.blue,                          
                          child:Text(title,
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                        )
                      )
      ),
    );
  }

  Widget createRow(String a, String b, String c, String d) {
    return Expanded(
          child: (
        Row(children: <Widget>[
                    createButton(a),
                    createButton(b),
                    createButton(c),
                    createButton(d)
          ])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding:EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container( //top part 
                  child: Padding(
                          padding:const EdgeInsets.all(2.0),
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Text(displayString
                            ),
                          ),
                 ),
              ),
            ),
            Expanded(
              child: Column( //buttons
                children: <Widget>[
                  createRow('+','-','*','/'),
                  createRow('7','8','9','0'),
                  createRow('6','5','4','AC'),
                  createRow('1','2','3','='),
                ]
           ),
            )
          ]
        ),
      )
    ); 
  }
}
