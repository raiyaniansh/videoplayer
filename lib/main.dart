import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/home/provider/home_provider.dart';
import 'package:video/home/view/home_screen.dart';
import 'package:video/player/view/player_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'player':(context) => PlayerScreen(),
        },
      ),
    ),
  );
}
