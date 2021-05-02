import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  String _display = "0";
  double _total = 0;
  double _tmp1 = 0;
  double _tmp2 = 0;
  String _op = "";

  void _fixDisplay() {
    _display = _display.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }

  void _clear() {
    _tmp1 = 0;
    _tmp2 = 0;
    _op = "";
    _total = 0;
    setState(() {
      _display = "0";
    });
  }

  void _setTmp(number) {
    if (_op == "") {
      _tmp1 = _tmp1 * 10 + number;
      setState(() {
        _display = _tmp1.toString();
        _fixDisplay();
      });
    } else {
      _tmp2 = _tmp2 * 10 + number;
      setState(() {
        _display = _tmp2.toString();
        _fixDisplay();
      });
    }
  }

  void _setOp(oper) {
    _op = oper;
    setState(() {
      _display = _op;
    });
  }

  void _calc() {
    if (_op == "+") {
      _total = _tmp1 + _tmp2;
    } else if (_op == "-") {
      _total = _tmp1 - _tmp2;
    } else if (_op == "×") {
      _total = _tmp1 * _tmp2;
    } else if (_op == "÷") {
      _total = _tmp1 / _tmp2;
    } else {
      _total = _tmp1;
    }

    setState(() {
      _display = _total.toString();
      _fixDisplay();
    });
    _tmp1 = _total;
    _tmp2 = 0;
    _op = "";
    _total = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    )
  }
}
