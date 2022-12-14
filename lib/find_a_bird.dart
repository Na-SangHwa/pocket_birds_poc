import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pocket_birds_poc/classifier.dart';
import 'package:pocket_birds_poc/classifier_quant.dart';

import 'package:logger/logger.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';



class MyBirdPage extends StatefulWidget {
  MyBirdPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyBirdPageState createState() => _MyBirdPageState();
}

class _MyBirdPageState extends State<MyBirdPage> {
  late Classifier _classifier;

  var logger = Logger();

  File? _image;
  final picker = ImagePicker();
  List? _outputs;

  Image? _imageWidget;

  img.Image? fox;

  Category? category;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierQuant();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);

      _predict();
    });
  }
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);

      _predict();
    });
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    var pred = _classifier.predict(imageInput);

    setState(() {
      this.category = pred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        children: <Widget>[

          SizedBox(
            height: 150,
          ),

          Center(
            child: _image == null
                ? Text('Press bottom button to select image.')
                : Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 2),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: _imageWidget,
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Text(
            category != null ? category!.label : '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);},

            child: Text('go back'),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

            FloatingActionButton(
              onPressed: pickImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.camera),

            ),
            FloatingActionButton(
              onPressed: getImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.wallpaper),
            ),
      ]
          )
        ],
      ),
    );
  }
}