import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/home/provider/home_provider.dart';
import 'package:media_bosster_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: HomeProvider()),],
    child: MaterialApp(
      routes: app_routes,
    ),
  )
      // MaterialApp(
      //   routes: app_routes,
      // ),
      );
}
