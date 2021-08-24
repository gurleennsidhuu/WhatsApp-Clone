import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

bool readReceipts = true;

class Privacy extends StatelessWidget {
  static const id = 'privacy';
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.017),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      right: MediaQuery.of(context).size.height * 0.02,
                      top: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Who can see my personal info',
                          style: TextStyle(
                              color: iconColor,
                              fontWeight: FontWeight.w800,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.021),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          "If you don't share your Last Seen, you won't be able to see other people's Last Seen",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0185),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'Last Seen',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'Profile photo',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'Status',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      trailing: Switch(
                        activeColor: Color(0xFF075E54),
                        inactiveTrackColor: Colors.grey,
                        onChanged: (bool value) {
                          if (readReceipts == false)
                            readReceipts = true;
                          else
                            readReceipts = false;
                        },
                        value: readReceipts,
                      ),
                      title: Text(
                        'Read receipts',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        "If turned off, you won't send or receive Read receipts. Read receipts are always send for group chats.",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0002,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'Groups',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'Live location',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'Blocked contacts',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: ListTile(
                      title: Text(
                        'Fingerprint lock',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      subtitle: Text(
                        'Nobody',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
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
