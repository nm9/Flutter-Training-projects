import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppImpl();
  }
}

class MyAppImpl extends State<MyApp>{
  final editCtrl = TextEditingController();
  bool showDialog = false;
  List<String> textList = [];
  List<bool> textChkBox = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("To-Do"),
            backgroundColor: Colors.blue,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  int ctr = 0;
                  while(ctr<textList.length){
                    if(textChkBox[ctr]==true){textChkBox.removeAt(ctr);textList.removeAt(ctr);ctr=0;}
                    else {ctr++;}
                  }
                  setState(() {});
                },
              ),
            ]
          ),
          body: Column(
            children: <Widget>[
            showDialog ==true?
            AlertDialog(
            title: Text("New task"),
            content: TextField(
              decoration: InputDecoration.collapsed(hintText: "Write task..."),
              onSubmitted: (String text){},
            ),
            actions: <Widget>[
              FlatButton(
              onPressed: (){setState(() {
              showDialog=false;
              textList.add(editCtrl.text);
              textChkBox.add(false);
              editCtrl.clear();
              });
              },
              child: Text("OK"),
              ),
            ],
            ): Text(""),
            Flexible(
              child: ListView.builder(
                itemCount: textList.length,
                itemBuilder: (BuildContext ctxt, int index){
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: textChkBox[index], 
                        onChanged: (bool newValue){
                          setState(() {
                            textChkBox[index]=newValue;
                          });
                        },),
                      Text(textList[index]),
                      ],
                      );
                },
                ),
              )
            ]
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState((){
                  showDialog = true;
                });
              }),
      ),
          );
    
  }
}