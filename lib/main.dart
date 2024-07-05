import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/home/provider/home_provider.dart';
import 'package:media_bosster_app/screen/provider/music_provider.dart';
import 'package:media_bosster_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider()),
      ChangeNotifierProvider.value(value: MusicProvider()),
    ],
    child: MaterialApp(
      themeMode: ThemeMode.dark,
      routes: app_routes,
    ),
  )
      // MaterialApp(
      //   routes: app_routes,
      // ),
      );
}
