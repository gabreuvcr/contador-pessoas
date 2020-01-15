import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String infoText = "Pode entrar!";

  void _clearPeople() {
    setState(() {
      _people = 0;
    });
  }

  void _changePeople(int delta) {
    setState(() {
      if(_people + delta >= -1) {
        _people += delta;
      }
      if(_people > 10) {
        infoText = "Está lotado!";
      }
      else if(_people < 0) {
        infoText = "Mundo invertido?";
      }
      else {
        infoText = "Pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.png",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people", 
              style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ), 
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ), 
              ],
            ),
            Text(
              "$infoText", 
              style: TextStyle(color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 18, decoration: TextDecoration.none),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: FlatButton(
                child: Text(
                  "Zerar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  _clearPeople();
                }
              )
            )
          ],
        )
      ],
    );
  }
}
