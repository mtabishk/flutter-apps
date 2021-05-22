import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyAppLW());
}

class MyAppLW extends StatefulWidget {
  @override
  _MyAppLWState createState() => _MyAppLWState();
}

class _MyAppLWState extends State<MyAppLW> {
  var img_url =
      "https://github.com/mtabishk/Linux-Integration-App-2/raw/master/images/18204_download-linux-wallpapers-mobile_1920x1200_h.jpg";
  var cmd;
  var webdata;

  myweb(cmd) async {
    //var url = "http://192.168.99.101/cgi-bin/web.py?x=${cmd}";
    var url = "http://13.127.123.21//cgi-bin/web.py?x=${cmd}";
    var r = await http.get(url);

    setState(() {
      webdata = r.body;
    });

    // print(webdata);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/rhel.png"),
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                // here the desired height
                child: AppBar(
                  backgroundColor: Colors.grey.shade900,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: Colors.red.shade900,
                      ),
                      onPressed: null,
                      iconSize: 40.0,
                    )
                  ],
                  title: Text(
                    'Linux Here',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                      fontFamily: 'Hacked',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              body: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 350,
                      height: 600,
                      color: Colors.grey.shade900,
                      child: ListView(
                        children: <Widget>[
                          // Card(
                          //   color: Colors.grey.shade900,
                          //   margin: EdgeInsets.only(bottom: 20),
                          //   child: Text(
                          //     "  Enter the Command : ",
                          //     textAlign: TextAlign.start,
                          //     style: TextStyle(
                          //       color: Colors.red,
                          //       fontWeight: FontWeight.bold,
                          //       fontFamily: 'Hacked',
                          //       fontSize: 20,
                          //     ),
                          //   ),
                          // ),

                          Theme(
                            data: new ThemeData(
                              primaryColor: Colors.red.shade600,
                              primaryColorDark: Colors.white,
                            ),
                            child: new TextField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white)),
                                hintText: 'Enter the command here',
                                labelText: 'Command',
                                prefixIcon: const Icon(
                                  Icons.laptop,
                                  color: Colors.red,
                                ),
                                prefixText: ' ',
                              ),
                              onChanged: (value) {
                                cmd = value;
                              },
                            ),
                          ),

                          FlatButton(
                              color: Colors.redAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                myweb(cmd);
                              },
                              child: Text('Click Here')),
                          Text(
                            webdata ?? "output is coming ..",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
