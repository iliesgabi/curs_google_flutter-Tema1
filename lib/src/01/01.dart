import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String? _price;
  String? _lei;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('convertor',
              style: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Column(children: <Widget>[
                  TextField(
                    onChanged: (String value) {
                      setState(() {
                        if (value.isEmpty) {
                          _price = null;
                        } else {
                          _price = value;
                        }
                      });
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(errorText: _error),
                  ),
                  RaisedButton(
                    onPressed: () {
                      RegExp regExp = RegExp(r'^[0-9]+(.[0-9]+)?$');
                      if (_price != null) {
                        if (regExp.hasMatch(_price!)) {
                          var euro = double.parse(_price!);
                          var lei = euro * 4.93;
                          setState(() {
                            _lei = lei.toStringAsFixed(2);
                          });
                          _error = null;
                        } else {
                          setState(() {
                            _error = "Incorrect input";
                            _lei = null;
                          });
                        }
                      } else {
                        setState(() {
                          _lei = null;
                        });
                      }
                    },
                    child: Text('convert'),
                    color: Colors.teal,
                  ),
                  if (_lei != null) Text(_lei!) else Text('result', style: TextStyle(fontSize: 20))
                ])),
                Image.network(
                    'https://inquamphotos.com/static10/preview2/inquam-photo-bani--lei-48825.jpg'),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
