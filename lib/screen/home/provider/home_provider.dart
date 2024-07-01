import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int? cIndex;
   // AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();
  bool choice = true;

  // List<String> imageCarsoul = [
  //   "assets/images/image1.jpg",
  //   "assets/images/image2.jpg",
  //   "assets/images/image3.jpg",
  //   "assets/images/image4.jpg",
  //   "assets/images/image4.jpg",
  // ];

  List audios = [
    // Audio("assets/audio/audio1.mp3"),
    // Audio("assets/audio/audio2.mp3"),
    // "assets/audio/audio1.mp3",
    // "assets/audio/audio2.mp3",
  ];

  void changeIndex(int index) {
    cIndex = index;
    notifyListeners();
  }

  // void initAudio() {
  //   assetsAudio.open(
  //       Playlist(
  //     audios: [
  //       Audio("assets/audio/audio1.mp3"),
  //       Audio("assets/audio/audio2.mp3")
  //       // Audio("${audios}"),
  //     ],
  //   )
  //
  //       // Audio("assets/audio/audio1.mp3"));
  //       // notifyListeners();
  //       );
  //   notifyListeners();
  // }

  void songRun()
  {
    choice = !choice;
    notifyListeners();
  }
}
