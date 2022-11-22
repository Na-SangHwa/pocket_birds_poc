import 'package:flutter/material.dart';

import 'package:pocket_birds_poc/navigation_page.dart';
import 'package:pocket_birds_poc/google_map_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Flexible(
              flex: 4,
              child: MyGoogleMapPage()
          ),
          Container(
              height: 5,
              color: Colors.black
          ),
          Flexible(
              flex: 1,
              child: MyNavPage()
              )
        ]
    );
  }
}
