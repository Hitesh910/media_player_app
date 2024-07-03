import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/music/model/music_model.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();
  bool isPlay = true;
  Duration endDuration = Duration(seconds: 0);
  Duration currentDuration = Duration(seconds: 0);
  int index = 0;

  // int? nIndex =0;

  List<MusicModel> allMusic = [
    MusicModel(
        image:
            "https://pagalfree.com/images/128Angaaron%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3",
        title: "Angaaron"),
    MusicModel(
        image:
            "https://pagalfree.com/images/128Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.mp3",
        title: "Suniyan Suniyan"),
    MusicModel(
        image:
            "https://pagalfree.com/images/128Rishte%20Naate%20-%20De%20Dana%20Dan%20128%20Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Rishte%20Naate%20-%20De%20Dana%20Dan%20128%20Kbps.mp3",
        title: "Rishte natte"),
    MusicModel(
        image:
            "https://pagalfree.com/images/128Raanjhanaa%20-%20Raanjhanaa%20128%20Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Raanjhanaa - Raanjhanaa 128 Kbps.mp3",
        title: "Raanjhanaa"),
    MusicModel(
        image:
            "https://pagalfree.com/images/128Banthan%20-%20Kurukshetra%20128%20Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Banthan - Kurukshetra 128 Kbps.mp3",
        title: "Banthan"),
  ];
  List<String> Music = [
    "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3",
    "https://pagalfree.com/musics/128-Raanjhanaa - Raanjhanaa 128 Kbps.mp3",
    "https://pagalfree.com/musics/128-Banthan - Kurukshetra 128 Kbps.mp3",
    "https://pagalfree.com/musics/128-Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.mp3",
  ];

  void initAudio() async {
    await assetsAudio.open(
        Playlist(
            startIndex: index,
            audios:
                // Music.map((e) => Audio.network(e)).toList()
                allMusic
                    .map(
                      (e) => Audio.network(e.song!),).toList()),
        loopMode: LoopMode.playlist,

        // Audio.network(
        //   "${allMusic[index!].song}",
        autoStart: false);
    endDurationSong();
    currentDurationSong();
  }

  void plyAndPause() {
    isPlay = !isPlay;

    if (isPlay) {
      assetsAudio.pause();
    } else {
      assetsAudio.play();
    }
    notifyListeners();
  }

  void endDurationSong() {
    endDuration = assetsAudio.current.value!.audio.duration;
    notifyListeners();
  }

  void currentDurationSong() {
    assetsAudio.currentPosition.listen(
      (event) {
        currentDuration = event;
        notifyListeners();
      },
    );
  }

  void checkIndex(int value) {
    index = value;
    notifyListeners();
  }

  void nextIndex(int value) {
    // nIndex = n;
    //nIndex++;
    index++;
    notifyListeners();
  }
}
