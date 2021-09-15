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
