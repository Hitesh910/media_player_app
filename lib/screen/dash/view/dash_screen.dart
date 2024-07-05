import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home/model/home_model.dart';
import '../../home/provider/home_provider.dart';
import '../../provider/music_provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  MusicProvider? mproviderR;
  MusicProvider? mproviderW;
  PageController pageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    mproviderR = context.read<MusicProvider>();
    mproviderW = context.watch<MusicProvider>();
    return Scaffold(
      key: scaffoldKey,
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
            child: GridView.builder(
              itemCount: providerW!.imageAlbum.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    providerR!.albumIndex(index);
                    showBottom();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    // color: Colors.red,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage("${providerR!.imageAlbum[index]}"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.black.withOpacity(0.2)),
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: mproviderW!.allMusic.length,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           Container(
          //             height: 80,
          //             width: MediaQuery.sizeOf(context).width,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //                 color: Colors.grey.shade300,
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(10))),
          //             child: ListTile(
          //               leading: Image.network(
          //                   "${mproviderR!.allMusic[index].image}"),
          //               title: Text("${mproviderR!.allMusic[index].title}"),
          //               onTap: () {
          //                 mproviderR!.checkIndex(index);
          //                 Navigator.pushNamed(context, 'music');
          //               },
          //             ),
          //           ),
          //           const Divider(),
          //         ],
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  void showBottom() {
    scaffoldKey.currentState?.showBottomSheet(
      (context) => BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Column(
            children: [
              Image(image: NetworkImage("${providerR!.imageAlbum[providerR!.aIndex]}"),fit: BoxFit.fill,),
              IconButton.filled(onPressed: () {

              }, icon: Icon(Icons.play_arrow)),
              Expanded(
                child: ListView.builder(
                  itemCount: mproviderW!.allList[providerR!.aIndex].length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 80,
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            leading: Image.network(
                                "${mproviderR!.allList[providerR!.aIndex][index].image}"),
                            title: Text("${mproviderR!.allList[providerR!.aIndex][index].title}"),
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
          );
        },
      ),
    );
    //     .showBottomSheet(
    //   context: context,
    //   builder: (context) {
    //     return Container(
    //       alignment: Alignment.topCenter,
    //       child: Text("hello"),
    //     );
    //   },
    // );
  }
}
