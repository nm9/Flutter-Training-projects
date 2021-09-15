import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: BaseApp(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => BaseApp(),
        '/LoginAsUser': (context) => LoginAsUser(),
        '/LoginAsGuest': (context) => LoginAsGuest()
      },
    );
  }
}

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multipage App")),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Login as User"),
              color: Colors.blue[300],
              onPressed: () {
                Navigator.pushNamed(context, '/LoginAsUser');
              },
            ),
            FlatButton(
              child: Text("Login as Guest"),
              color: Colors.red[100],
              onPressed: () {
                Navigator.pushNamed(context, '/LoginAsGuest');
              },
            )
          ],
        ),
      ),
    );
  }
}

class LoginAsUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome User"),
      ),
      body: RaisedButton(
        child: Text('Go Back'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class LoginAsGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Guest"),
      ),
      body: RaisedButton(
        child: Text('Go Back'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
