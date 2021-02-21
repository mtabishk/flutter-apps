import 'package:flutter/material.dart';
import 'package:music_video_app/LocalMusicPage.dart';
import 'package:music_video_app/LocalVideoPage.dart';
import 'package:music_video_app/OnlineMusicPage.dart';
import 'package:music_video_app/OnlineVideoPage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaApp(),
    ));

class MediaApp extends StatefulWidget {
  @override
  _MediaAppState createState() => _MediaAppState();
}

class _MediaAppState extends State<MediaApp> {
  int _currentIndex = 0;
  final Tabs = [
    LocalMusicPage(),
    OnlineMusicPage(),
    LocalVideoPage(),
    OnlineVideoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      // Main Body
      body: Tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          // Different Items of the App Bar
          items: [
            // Local Music
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
                color: Colors.white,
              ),
              title: Text(
                'Local Music',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),

            // Online Music
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
                color: Colors.white,
              ),
              title: Text(
                'Online Music',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),

            // Local Video
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library,
                color: Colors.white,
              ),
              title: Text(
                'Local Video',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),

            // Online Video
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library,
                color: Colors.white,
              ),
              title: Text(
                'Online Video',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
          ],

          // This will help us to change the view when we Tap the Icon
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    ));
  }
}
