import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.crop)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.emoji_emotions_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.text_fields)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Image.file(
          File(widget.imagePath),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
