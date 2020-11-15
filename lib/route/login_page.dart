import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("TItle"),
          Text("Egy kis leírás"),
          RaisedButton(child: Text("Google bejelentkezés"), onPressed: () {}),
          RaisedButton(
              child: Text("Tovább bejelentkezés nélkül"), onPressed: () {})
        ],
      ),
    );
  }
}
