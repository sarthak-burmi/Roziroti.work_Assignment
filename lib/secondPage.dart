import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  int? currentPlayingIndex;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.setAsset(_musicList.isNotEmpty ? _musicList[0].audioUrl : '');
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playMusic(String audioUrl, int index) async {
    await audioPlayer.setAsset(audioUrl);
    await audioPlayer.play();
    if (mounted) {
      setState(() {
        isPlaying = true;
        currentPlayingIndex = index;
      });
    }
  }

  void pauseMusic() {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void stopMusic() {
    audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Image.asset(
              "assets/images/Bhajan3.jpeg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bhajan",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.oswald(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _musicList.length,
                      itemBuilder: (context, index) {
                        final bhajan = _musicList[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: ListTile(
                            title: Text(
                              bhajan.title,
                              style: GoogleFonts.oswald(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              bhajan.artist,
                              style: GoogleFonts.oswald(
                                fontSize: 15,
                                color: Color.fromARGB(255, 121, 120, 120),
                              ),
                            ),
                            trailing: currentPlayingIndex == index && isPlaying
                                ? IconButton(
                                    icon: Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                    ),
                                    onPressed: pauseMusic,
                                  )
                                : IconButton(
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      playMusic(bhajan.audioUrl, index);
                                    },
                                  ),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Bhajan {
  final String title;
  final String artist;
  final String audioUrl;

  Bhajan({
    required this.title,
    required this.artist,
    required this.audioUrl,
  });
}

List<Bhajan> _musicList = [
  Bhajan(
    title: 'Ram Siya Ram',
    artist: 'Sachet Tandon,Parampara Tandon & Ajay - Atul Adipurush',
    audioUrl: 'assets/Music/_Ram Siya Ram(PagalWorld.com.pe).mp3',
  ),
  Bhajan(
    title: 'Mere Ghar Ram Aaye Hain',
    artist: 'Jubin Nautiyal',
    audioUrl: 'assets/Music/Mere Ghar Ram Aaye Hain(PagalWorld.com.pe).mp3',
  ),
];
