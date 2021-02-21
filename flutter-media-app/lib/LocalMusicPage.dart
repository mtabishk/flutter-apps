import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class LocalMusicPage extends StatelessWidget {
  AudioPlayer advancedplayer;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(40, 96, 65, 7.0),
              Color(0xFF191414),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Play Local Music",
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
                  child: Image.asset("assets/DJ_Khaled_Greece.png"),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () async {
                          advancedplayer =
                              await AudioCache().loop('greece.mp3');
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
