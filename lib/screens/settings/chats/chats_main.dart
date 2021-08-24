import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class Chats extends StatelessWidget {
  static const id = 'chats_main';
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Display',
                    style: TextStyle(
                        color: iconColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w500),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.brightness_medium_sharp,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                    title: Text(
                      'Theme',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                    subtitle: Text(
                      'System default',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.019),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.wallpaper,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                    title: Text(
                      'Wallpaper',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0001,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chat settings',
                    style: TextStyle(
                        color: iconColor,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Enter is send',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022),
                          ),
                          subtitle: Text(
                            'Enter key will send your message',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.019),
                          ),
                          trailing: Switch(
                            activeColor: Color(0xFF075E54),
                            inactiveTrackColor: Colors.grey,
                            onChanged: (bool value) {},
                            value: true,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Media visibility',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022),
                          ),
                          subtitle: Text(
                            "Show newly downloaded media in your phone's gallery",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.019),
                          ),
                          trailing: Switch(
                            activeColor: Color(0xFF075E54),
                            inactiveTrackColor: Colors.grey,
                            onChanged: (bool value) {},
                            value: true,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Font size',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022),
                          ),
                          subtitle: Text(
                            'Medium',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.019),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0001,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'App Language',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                    subtitle: Text(
                      "Phone's language (English)",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.019),
                    ),
                    leading: Icon(
                      Icons.language,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Chat backup',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                    leading: Icon(
                      Icons.backup,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Chat history',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                    leading: Icon(
                      Icons.history,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
