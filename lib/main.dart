import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AdminPage.dart';
import 'UserPage.dart';

void main() => runApp(MyApp());
String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'LOGIN',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(),
        '/UserPage': (BuildContext context) => new UserPage(),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response = await http
        .post("http://192.168.43.251/store/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['level'] == 'user') {
        Navigator.pushReplacementNamed(context, '/UserPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: new BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/appimages/bungaku.jpg'),
          fit: BoxFit.cover,
        )),
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        new TextField(
                          controller: user,
                          decoration: InputDecoration(
                              hintText: "Username",
                              labelText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        new TextField(
                          obscureText: true,
                          controller: pass,
                          decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        new RaisedButton(
                          child: new Row(
                            children: <Widget>[
                              new Icon(Icons.verified_user),
                              new Text("Login")
                            ],
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            _login();
                          },
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text(
                          msg,
                          style: new TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
