import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int? cIndex;
   // AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();
  bool choice = true;
  int selectIndex = 0;
  int aIndex= 0;

  List<String> imageAlbum = [
    "https://c.saavncdn.com/editorial/PopMeinTop_20240701103058_150x150.jpg",
    "https://c.saavncdn.com/505/Husn-Irani-From-Wild-Wild-Punjab-Hindi-2024-20240627151003-150x150.jpg",
    "https://c.saavncdn.com/editorial/Hindi-IndiaSuperhitsTop50_20240705025241_150x150.jpg",
    "https://c.saavncdn.com/editorial/BestOfIndieHindi_20240624065052_150x150.jpg",
  ];

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

  void bottomIndex(int value)
  {
    selectIndex = value;
    notifyListeners();
  }

  void albumIndex(int index)
  {
    aIndex = index;
    notifyListeners();
  }
}
