import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MusicProvider>().initAudio();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        // alignment: Alignment.center,
        children: [
          //Spacer(),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(spreadRadius: 10, blurRadius: 20)],
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff605C3C), Color(0xff3C3B3F)],
              ),
            ),
          ),
          // Spacer(),
          Column(
            children: [
              const Spacer(),
              Container(
                height: 200,
                width: 200,
                // color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(blurRadius: 10, spreadRadius: -5)],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${providerR!.allMusic[providerR!.index!].image}"))),
              ),
              const Spacer(),
              Slider(
                value: providerW!.currentDuration.inSeconds.toDouble(),
                max: providerW!.endDuration.inSeconds.toDouble(),
                onChanged: (value) {
                  providerW!.assetsAudio.seek(Duration(seconds: value.toInt()));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 5, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${providerW!.currentDuration}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "${providerW!.endDuration}",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shuffle,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 50,
                      )),
                  IconButton.filled(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        providerW!.plyAndPause();
                      },
                      icon: providerW!.isPlay
                          ? const Icon(
                              Icons.play_arrow,
                              color: Colors.deepPurple,
                              size: 50,
                            )
                          : const Icon(
                              Icons.pause,
                              color: Colors.deepPurple,
                              size: 50,
                            )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 50,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.loop,
                        color: Colors.white,
                      ))
                ],
              ),
              // Row(children: [Text("00:00:00"),Text("00:00:00")],),
              const SizedBox(
                height: 40,
              )
              // // Slider(
              //   value: 0.5,
              //   onChanged: (value) {},
              // )
            ],
          ),
          // Spacer(),
          // Slider(value: 0.5, onChanged: (value) {
          //
          // },)
        ],
      ),
    );
  }
}
