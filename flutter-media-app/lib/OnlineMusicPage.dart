import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class OnlineMusicPage extends StatelessWidget {
  AudioPlayer advancedplayer;
  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(
      colors: [
        Color.fromRGBO(40, 96, 65, 7.0),
        Color(0xFF191414),
      ],
    );
    return Container(
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Play Online Music",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Image.network(
                      "https://github.com/mtabishk/flutter-media-app/raw/master/images/220px-Juice_Wrld_-_Smile.png"),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () async {
                          await advancedplayer
                              .play('https://iamsami.tech/assets/smile.mp3');
                        },
                        child: Icon(
                          Icons.play_arrow,
                          size: 50.0,
                        )),
                    FlatButton(
                        onPressed: () async {
                          advancedplayer.pause();
                        },
                        child: Icon(
                          Icons.pause,
                          size: 50.0,
                        )),
                    FlatButton(
                        onPressed: () async {
                          advancedplayer.stop();
                        },
                        //print("Button Clicked");

                        child: Icon(
                          Icons.stop,
                          size: 50.0,
                        )),
                  ],
                ),
                // padding: EdgeInsets.all(80),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                margin: EdgeInsets.only(top: 30, right: 20, left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ));
  }
}
