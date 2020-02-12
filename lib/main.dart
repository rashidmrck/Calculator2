import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calaculator',
      home: Calaculator(),
    );
  }
}

class Calaculator extends StatefulWidget {
  @override
  _CalaculatorState createState() => _CalaculatorState();
}

class _CalaculatorState extends State<Calaculator> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                )),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+')
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('CLEAR'),
                    buildButton('='),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () => _buttonPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _buttonPressed(String text) {
    if (text == 'CLEAR') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (text == '+' || text == '/' || text == 'x' || text == '-') {
      num1 = double.parse(output);
      operand = text;
      _output = '0';
    } else if (text == '.') {
      if (_output.contains('.')) {
        print('Already have decimal');
        return;
      } else {
        _output = _output + text;
      }
    }
    else if(text == '='){
      num2 = double.parse(output);
      if(operand == '+'){
        _output = (num1 + num2).toString();
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
      }
      if(operand == 'x'){
        _output = (num1 * num2).toString();
      }
      if(operand == '/'){
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }else{
      _output = _output + text;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
}
