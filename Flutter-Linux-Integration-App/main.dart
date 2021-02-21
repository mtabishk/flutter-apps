import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(myIntegApp());

var cmd;

web(cmd) async {
  var url = "http://192.168.99.101/cgi-bin/web.py?x=${cmd}";
  var response = await http.get(url);
  print(response.body);
}

class myIntegApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Linux Integration App"),
            backgroundColor: Colors.blueGrey,
            leading: Icon(Icons.settings_remote),
            actions: <Widget>[
              IconButton(
                  padding: EdgeInsets.only(right: 30),
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey.shade900,
                    size: 40.0,
                  ),
                  onPressed: () => print("HomePage")),
            ]),
        body: Container(
            color: Colors.grey.shade900,
            child: Center(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 350,
                        color: Colors.blueGrey,
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your command",
                                  prefixIcon: Icon(Icons.laptop)),
                              autocorrect: false,
                              textAlign: TextAlign.start,
                              onChanged: (value) {
                                cmd = value;
                              },
                            ),
                            FlatButton(
                              onPressed: () {
                                web(cmd);
                              },
                              child: Text("Click Here"),
                              color: Colors.grey.shade900,
                              textColor: Colors.white,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
