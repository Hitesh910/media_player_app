import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/music/view/music_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "music":(context) => MusicScreen(),
};