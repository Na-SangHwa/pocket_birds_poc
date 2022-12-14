import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pocket_birds_poc/find_a_bird.dart';



class MyNavPage extends StatefulWidget {
  const MyNavPage({super.key});

  @override
  _MyNavPageState createState() => _MyNavPageState();
}

class _MyNavPageState extends State<MyNavPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> MyBirdPage())
                );
              },
              child: Text('Camera'),

            ),

            SizedBox(
              width: 50,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> MyBirdPage())
                );
              },
              child: Text('Book'),
            )
          ],
        ),
            ),
      );
  }
}