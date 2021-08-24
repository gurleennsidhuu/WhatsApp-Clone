import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/screens/contact_support.dart';

class HelpScreen extends StatelessWidget {
  static const id = 'Help_Screen';
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem detected'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.height * 0.04,
                right: MediaQuery.of(context).size.height * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We didn't detect a valid phone number.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Please go back to the previous screen and enter your phone number in full international format:",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    children: [
                      Text(
                        "1. Choose your country from country list. This will automatically fill the country code.",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "2. Enter your phone number. Omit any leading 0s before the phone number.",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "For example, a correct United States phone number will appear as +1 (408) 555-1234 after being entered.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'For more information, please read our ',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              color: Colors.black87)),
                      TextSpan(
                        text: "FAQ.",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch(
                              'https://www.whatsapp.com/legal/privacy-policy?lg=en&lc=GB&eea=0',
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
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ContactSupport.id);
              },
              child: Container(
                color: Color(0xff0fc6ac),
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "This doesn't answer my question",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
