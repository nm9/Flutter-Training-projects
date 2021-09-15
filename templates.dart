//from drawers_intro
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppImpl();
  }
}

class MyAppImpl extends State<MyApp> {
  int counter=0;
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Drawer Example"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text("The Header"),
                decoration: BoxDecoration(color: Colors.orangeAccent),
              ),
              ListTile(
                title: Text("First option"),
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                   counter++;
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context) => TestApp() )
                     );
                  });
              },),
              ListTile(
                title: Text("Second option"),
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                   counter+=2; 
                  });
                },)
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Center(child: Text("The counter is $counter."),),
            TextField(
              decoration: InputDecoration.collapsed(hintText: "Username"),
              onChanged: (String text){},
              onSubmitted: (String text){setState((){count++;});}
            ),
            Center(child: Text("The count is $count."),),
          ],
        )

      );
  }
}

class TestApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Testing testing"),),);
  }
}


//from first flutter app
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("AppBar with Tabs"),
            backgroundColor: Colors.blue,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                  print("Help pressed");
                },
              ),
              PopupMenuButton<IconButton>(
                onSelected: null,
                itemBuilder: (BuildContext ctxt) {
                  return <PopupMenuItem<IconButton>>[
                    PopupMenuItem<IconButton>(
                        child: IconButton(
                            icon: Icon(Icons.info), onPressed: null)),
                    PopupMenuItem<IconButton>(
                        child: IconButton(
                            icon: Icon(Icons.keyboard), onPressed: null)),
                  ];
                },
              )
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.history)),
                Tab(icon: Icon(Icons.mail)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //Text("History selected"),
              HistoryAction(),
              //Text("Mail selected")
              MailAction()
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                print("Floating action button pressed");
              }),
          bottomNavigationBar: BottomAppBar(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add_alarm),
                    onPressed: () {
                      print("Button 1 triggered..");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {
                      print("Button 2 triggered..");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      print("Button 3 triggered..");
                    },
                  )
                ],
              ),
              color: Colors.blueGrey),
          persistentFooterButtons: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.help),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}

class MailAction extends StatelessWidget {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    counter++;  
    return Text("Counter value = $counter");
  }
}

class HistoryAction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HistoryActionApp();
  }
}

class HistoryActionApp extends State<HistoryAction> {
  int counter = 0;
  bool tickmark = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Counter value = $counter"),
        Checkbox(
          value: tickmark,
          onChanged: (bool newValue) {
            setState(() {
              counter++;
              tickmark = newValue;
            });
          },
        )
      ],
    );
  }
}


//from first multipage project
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
