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