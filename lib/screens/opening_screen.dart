import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/screens/registration_screen.dart';

class OpeningScreen extends StatefulWidget {
  static const id = 'opening_screen';
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.03,
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                    color: textColor,
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Image.asset(
                'images/welcome_whatsapp.jpg',
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          color: Colors.grey[600],
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                      children: <TextSpan>[
                        TextSpan(text: 'Read our '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launch(
                                'https://www.whatsapp.com/legal/privacy-policy?lg=en&lc=GB&eea=0',
                                forceSafariVC: false,
                              );
                            },
                        ),
                        TextSpan(
                            text: '.Tap "Agree and continue" to accept the '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launch(
                                'https://www.whatsapp.com/legal/terms-of-service?lg=en&lc=GB&eea=0',
                                forceSafariVC: false,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Registration.id);
                    },
                    child: Text(
                      'AGREE AND CONTINUE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica',
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 3.5,
                      primary: neonGreen,
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.height * 0.02),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: MediaQuery.of(context).size.width * 0.043,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'FACEBOOK',
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: neonGreen,
                        letterSpacing: 4,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
