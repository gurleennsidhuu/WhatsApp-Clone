import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class ChatBackup extends StatelessWidget {
  static const id = 'chat_backup';
  const ChatBackup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat backup'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.backup,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      'Last Backup',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: iconColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Back up your messages and media to Google Drive. You can restore them when you reinstall WhatsApp. Your messages will also back up to your phone's internal storage.",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Local: Yesterday, 2:10 am',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Google Drive: Yesterday, 10:05 am',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Size: 5.9 GB',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: neonGreen),
                        onPressed: () {},
                        child: Text('BACK UP'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.00012,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.add_to_drive,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Google Drive settings',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: iconColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  child: Column(
                    children: [
                      Text(
                        'Messages and media backed up in Google Drive are not protected by WhatsApp end-to-end encryption',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018),
                      ),
                      ListTile(
                        title: Text(
                          'Back up to Google Drive',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.021),
                        ),
                        subtitle: Text('Daily',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height *
                                    0.019)),
                      ),
                      ListTile(
                        title: Text(
                          'Google Account',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.021),
                        ),
                        subtitle: Text(
                          'ginnisidhu1997@gmail.com',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.019),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Back up over',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.021),
                        ),
                        subtitle: Text(
                          'Wi-Fi only',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.019),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Include videos',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.021),
                          ),
                          Switch(value: false, onChanged: (value) {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
