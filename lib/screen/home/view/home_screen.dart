// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:media_bosster_app/screen/home/model/home_model.dart';
// import 'package:provider/provider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:media_bosster_app/utils/import.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  PageController pageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<HomeProvider>().initAudio();
     assetsAudio.open(Audio("assets/audio/audio1.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Media_Bossterß"),
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
          SizedBox(
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
                     assetsAudio.play();
                //     : providerR!.assetsAudio.stop();
                // print(providerW!.choice);
              },
              icon:
              // providerW!.choice == false
              //     ?
              Icon(Icons.play_arrow)
                  // : Icon(Icons.stop)
    )
        ],
      ),
    );
  }
}
