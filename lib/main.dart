import 'package:flutter/material.dart';
import 'package:pocket_birds_poc/home.dart';

import 'package:pocket_birds_poc/find_a_bird.dart';


void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'pocket birds poc',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );

  }
}
