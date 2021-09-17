import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/screens/chat_screen.dart';

class ContactSupport extends StatefulWidget {
  static const id = 'Contact_Support';
  const ContactSupport({Key? key}) : super(key: key);

  @override
  _ContactSupportState createState() => _ContactSupportState();
}

TextEditingController complaint = TextEditingController();
bool validate = false;
final ImagePicker _picker = ImagePicker();
late XFile image1;
late XFile image2;
late XFile image3;
bool found1 = false;
bool found2 = false;
bool found3 = false;
bool next = false;

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Support'),
      ),
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: complaint,
                  decoration: InputDecoration(
                    errorText:
                        validate ? 'Describe your problem further' : null,
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Describe your problem',
                  ),
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (String text) {
                    if (text.length >= 30) {
                      setState(() {
                        next = true;
                      });
                    } else {
                      setState(() {
                        next = false;
                      });
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Text(
                  'Add screenshots (optional)',
                  style: TextStyle(
                      color: textColor,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (await Permission.photos.isGranted) {
                          image1 = (await _picker.pickImage(
                              source: ImageSource.gallery))!;
                          setState(() {
                            found1 = true;
                          });
                        } else
                          Permission.photos.request();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: !found1
                            ? Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.03),
                                color: Colors.grey[200],
                                child: Material(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  color: Colors.grey,
                                ),
                              )
                            : Image.file(
                                File(image1.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (await Permission.photos.isGranted) {
                          image2 = (await _picker.pickImage(
                              source: ImageSource.gallery))!;
                          setState(() {
                            found2 = true;
                          });
                        } else
                          Permission.photos.request();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: !found2
                            ? Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.03),
                                color: Colors.grey[200],
                                child: Material(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  color: Colors.grey,
                                ),
                              )
                            : Image.file(
                                File(image2.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (await Permission.photos.isGranted) {
                          image3 = (await _picker.pickImage(
                              source: ImageSource.gallery))!;
                          setState(() {
                            found3 = true;
                          });
                        } else
                          Permission.photos.request();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: !found3
                            ? Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.03),
                                color: Colors.grey[200],
                                child: Material(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  color: Colors.grey,
                                ),
                              )
                            : Image.file(
                                File(image3.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Visit our Help Centre',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launch(
                          'https://faq.whatsapp.com/general?lg=en&lc=GB&eea=0&anid=a0594c88-868f-4f17-93c7-7ebaf08d6905',
                          forceSafariVC: false,
                        );
                      },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    primary: neonGreen,
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02),
                  ),
                  onPressed: !next
                      ? null
                      : () {
                          if (complaint.text.length < 1) {
                            setState(() {
                              validate = true;
                            });
                          } else {
                            Navigator.pushNamed(context, ChatScreen.id);
                          }
                        },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
