import 'package:flutter/material.dart';

class DarkTheme extends StatelessWidget {
  static const id = 'dark_theme';
  const DarkTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Theme Wallpaper'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Wallpaper Dimming'),
          ],
        ),
      ),
    );
  }
}
