import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController videoPlayerController;
Future<void> initializePlayer;

class OnlineVideoPage extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: VideoPlayerScreen(),
        ));
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Play Online Video",
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
                  child: Card(
                      child: FutureBuilder(
                          future: initializePlayer,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                    child: VideoPlayer(videoPlayerController)),
                              );
                            } else {
                              return AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Card(
                                  child: Container(
                                    color: Colors.black87,
                                  ),
                                ),
                              );
                            }
                          })),
                )),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                setState(() {});
                                videoPlayerController =
                                    VideoPlayerController.network(
                                        'https://github.com/mtabishk/flutter-media-app/raw/master/video_files/Panasonic%20Lumix%20FZ300%204k%20F2.8%20Sample%20Video%20Camera%20Test_kH8FnnKLacc_360p.mp4');
                                initializePlayer =
                                    videoPlayerController.initialize();
                                videoPlayerController.setVolume(1.0);
                                videoPlayerController.play();
                              },
                              child: Icon(
                                Icons.play_arrow,
                                size: 50.0,
                              )),
                          FlatButton(
                              onPressed: () {
                                videoPlayerController.pause();
                              },
                              child: Icon(
                                Icons.pause,
                                size: 50.0,
                              )),
                          FlatButton(
                              onPressed: () {
                                videoPlayerController.pause();
                              },
                              //print("Button Clicked");

                              child: Icon(
                                Icons.stop,
                                size: 50.0,
                              )),
                        ],
                      ),
                      // padding: EdgeInsets.all(80),
                      //width: MediaQuery.of(context).size.width * 0.8,
                      height: 60,
                      margin: EdgeInsets.only(top: 30, right: 20, left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    // Container(
                    //     height: 60,
                    //     margin: EdgeInsets.only(top: 100),
                    //     child: Card(
                    //       child: RaisedButton(
                    //         child: Card(
                    //           child: Text(
                    //             'Play',
                    //             style: TextStyle(
                    //                 fontSize: 20, fontStyle: FontStyle.italic),
                    //           ),
                    //           color: Colors.purple,
                    //         ),
                    //         onPressed: () {
                    //           setState(() {});
                    //           videoPlayerController =
                    //               VideoPlayerController.asset(
                    //                   'assets/sample.mp4');
                    //           initializePlayer =
                    //               videoPlayerController.initialize();
                    //           videoPlayerController.setVolume(1.0);
                    //           videoPlayerController.play();
                    //         },
                    //       ),
                    //     )),
                    // Container(
                    //   height: 50,
                    //   margin: EdgeInsets.only(top: 100),
                    //   child: RaisedButton(
                    //     child: Card(
                    //       child: Text('Pause',
                    //           style: TextStyle(
                    //               fontSize: 20, fontStyle: FontStyle.italic)),
                    //       color: Colors.purple,
                    //     ),
                    //     onPressed: () {
                    //       videoPlayerController.pause();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                // Container(
                //   padding: EdgeInsets.only(bottom: 10),
                // )
              ]),
        ));
  }
}
