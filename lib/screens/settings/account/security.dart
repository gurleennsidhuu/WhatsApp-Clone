import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/constants/color_constants.dart';

class Security extends StatelessWidget {
  static const id = 'security';
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Security'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WhatsApp secures your conversations with end-to-end encryption. This means your messages, calls and status updates stay between people you choose. Not even WhatsApp can read or listen to them.',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.023),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Learn more",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.023),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch(
                              'https://www.whatsapp.com/legal/privacy-policy?lg=en&lc=GB&eea=0https://www.whatsapp.com/security?lg=en&lc=GB&eea=0',
                              forceSafariVC: false,
                            );
                          },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0003,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black54),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Show security notifications',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022),
                        ),
                        Switch(
                          activeColor: Color(0xFF075E54),
                          inactiveTrackColor: Colors.grey,
                          onChanged: (bool value) {},
                          value: true,
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Turn on this setting to receive notifications when one of your contact's security code changes.",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.019,
                            ),
                          ),
                          TextSpan(
                            text: " Learn more",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.019),
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
            ],
          ),
        ));
  }
}
