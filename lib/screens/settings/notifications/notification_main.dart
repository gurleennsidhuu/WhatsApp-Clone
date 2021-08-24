import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class NotificationScreen extends StatelessWidget {
  static const id = 'notification';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: ListTile(
                  title: Text(
                    'Conversation tones',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.021),
                  ),
                  subtitle: Text(
                    'Play sounds for incoming and outgoing messages.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.0185,
                    ),
                  ),
                  trailing: Switch(
                    activeColor: Color(0xFF075E54),
                    inactiveTrackColor: Colors.grey,
                    onChanged: (bool value) {},
                    value: true,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.00015,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black54),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: iconColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Notification tone',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Default (Silent)',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Vibrate',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Default',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Popup notification',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Not available',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Light',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'White',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Use high priority notifications',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Show previews of notifications at the top of the screen',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                      trailing: Switch(
                        activeColor: Color(0xFF075E54),
                        inactiveTrackColor: Colors.grey,
                        value: true,
                        onChanged: (bool value) {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.00015,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black54),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Text(
                          'Groups',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: iconColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Notification tone',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Default (Silent)',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Vibrate',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Default',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Light',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'White',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Use high priority notifications',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Show previews of notifications at the top of the screen',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                      trailing: Switch(
                        activeColor: Color(0xFF075E54),
                        inactiveTrackColor: Colors.grey,
                        value: true,
                        onChanged: (bool value) {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.00015,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black54),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Text(
                          'Calls',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: iconColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text('Ringtone',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.021)),
                      subtitle: Text(
                        'Default (Maybe)',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Vibrate',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      subtitle: Text(
                        'Default',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
