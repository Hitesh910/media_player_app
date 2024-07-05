import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/dash/view/dash_screen.dart';
import 'package:media_bosster_app/screen/home/model/home_model.dart';
import 'package:media_bosster_app/screen/provider/music_provider.dart';
import 'package:media_bosster_app/screen/video/view/video_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:media_bosster_app/utils/import.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  MusicProvider? mproviderR;
  MusicProvider? mproviderW;
  PageController pageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<HomeProvider>().initAudio();
    //  assetsAudio.open(Audio("assets/audio/audio1.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    mproviderR = context.read<MusicProvider>();
    mproviderW = context.watch<MusicProvider>();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Media Bosster"),
      // ),
      body: Column(
        children: [
          providerW!.selectIndex == 0
          ?Expanded(child: DashScreen())
              :Expanded(child: VideoScreen())
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 50,width: MediaQuery.sizeOf(context).width,color: Colors.red,child: ListTile(
        leading: Image.network(
            "${mproviderR!.allList[providerR!.aIndex][mproviderW!.index].image}"),
        title: Text("${mproviderR!.allList[providerR!.aIndex][mproviderW!.index].title}"),
        onTap: () {
          // mproviderR!.checkIndex(mindex);
          Navigator.pushNamed(context, 'music');
        },
      ),),
          BottomNavigationBar(
            currentIndex: providerW!.selectIndex,
            onTap: (value) {
              providerR!.bottomIndex(value);
              // mproviderR!.songIndex(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Music"),
              BottomNavigationBarItem(icon: IconButton.filledTonal(icon: Icon(Icons.add), onPressed: () {  },), label: "Music"),

              BottomNavigationBarItem(icon: Icon(Icons.video_camera_back_rounded),label: "Video"),
            ],
          ),
        ],
      ),
    );
  }
}
// Scaffold//
/*
* Scaffold(
      appBar: AppBar(
        title: const Text("Media_Bossterß"),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
              itemCount: imageCarsoul.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${imageCarsoul[index]}"),
                          fit: BoxFit.fitWidth)),
                );
              },
              options: CarouselOptions(
                initialPage: imageCarsoul.length,
                autoPlay: true,
                height: 200,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  providerR!.changeIndex(index);
                  pageController = PageController(initialPage: index);
                },
              )),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: imageCarsoul.length,
          ),
          IconButton(
              onPressed: () {
                // assetsAudio.open(Audio("assets/audio/audio1.mp3"));
                // // assetsAudio.
                // providerW!.songRun(true);
                // providerW!.choice == true
                //      assetsAudio.play();
                //     : providerR!.assetsAudio.stop();
                // print(providerW!.choice);
              },
              icon:
                  // providerW!.choice == false
                  //     ?
                  const Icon(Icons.play_arrow)
              // : Icon(Icons.stop)
              ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'music');
              },
              child: const Text("Music")),
          Expanded(
            child: ListView.builder(
              itemCount: mproviderW!.allMusic.length,
              itemBuilder: (context, index) {
              return  Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Image.network("${mproviderR!.allMusic[index].image}"),
                        title: Text("${mproviderR!.allMusic[index].title}"),
                        onTap: () {
                          mproviderR!.checkIndex(index);
                          Navigator.pushNamed(context, 'music');
                        },
                      ),
                    ),
                    const Divider(),

                  ],
                );
              },
            ),
          )
        ],
      ),
    );*/
