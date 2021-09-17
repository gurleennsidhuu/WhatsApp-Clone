import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'home_screen.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class SetProfile extends StatefulWidget {
  static const id = 'set_profile';
  const SetProfile({Key? key}) : super(key: key);

  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  TextEditingController _userNameController = new TextEditingController();
  String userName = "";
  final ImagePicker _picker = ImagePicker();
  XFile? userDp;
  bool emojiShowing = false;

  _onEmojiSelected(Emoji emoji) {
    _userNameController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _userNameController.text.length));
  }

  _onBackspacePressed() {
    _userNameController
      ..text = _userNameController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _userNameController.text.length));
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  children: [
                    Text(
                      'Profile Info',
                      style: TextStyle(
                        color: Color(0xFF209782),
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'Please provide your name and an option photo.',
                      //style: Text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: textIconColorGray,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () async {
                              if (await Permission.photos.isGranted) {
                                userDp = (await _picker.pickImage(
                                    source: ImageSource.gallery))!;
                              } else
                                Permission.photos.request();
                              print(userDp!.path);
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _userNameController,
                            decoration:
                                InputDecoration(hintText: 'Enter your name.'),
                            onChanged: (value) {
                              userName = value;
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: textIconColorGray,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.emoji_emotions),
                            onPressed: () {
                              setState(() {
                                emojiShowing = !emojiShowing;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        print(FirebaseAuth.instance.currentUser!.uid);
                        await FirebaseDatabase.instance
                            .reference()
                            .child('User')
                            .child(FirebaseAuth.instance.currentUser!.uid)
                            .set({
                          'uid': FirebaseAuth.instance.currentUser!.uid,
                          'name': userName,
                          'photoUrl': userDp == null ? "default" : userDp!.path,
                          'bio': 'Hey there, I am using WhatsApp'
                        });
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: greenColor,
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.08,
                            MediaQuery.of(context).size.height * 0.02,
                            MediaQuery.of(context).size.width * 0.08,
                            MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Offstage(
              offstage: !emojiShowing,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                    onEmojiSelected: (Category category, Emoji emoji) {
                      _onEmojiSelected(emoji);
                    },
                    onBackspacePressed: _onBackspacePressed,
                    config: const Config(
                        columns: 7,
                        emojiSizeMax: 32.0,
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.RECENT,
                        bgColor: Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        progressIndicatorColor: Colors.blue,
                        backspaceColor: Colors.blue,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecentsText: 'No Recents',
                        noRecentsStyle:
                            TextStyle(fontSize: 20, color: Colors.black26),
                        categoryIcons: CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
