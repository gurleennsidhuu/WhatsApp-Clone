import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/constants/color_constants.dart';

class RequestAccInfo extends StatelessWidget {
  static const id = 'request_acc_info';
  const RequestAccInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request account info'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Create a report of your WhatsApp account information and settings, which you can access or port to another app. This report does not include your messages.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0225),
                        ),
                        TextSpan(
                          text: 'Learn More',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0225),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launch(
                                'https://faq.whatsapp.com/general/security-and-privacy/security-code-change-notification?lg=en&lc=GB&eea=0',
                                forceSafariVC: false,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0006,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            ListTile(
              title: Text(
                'Request report',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.022),
              ),
              leading: Icon(
                Icons.insert_drive_file_rounded,
                color: iconColor,
                size: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0001,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
