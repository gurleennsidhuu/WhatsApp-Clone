import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:whatsapp/screens/camera_screen.dart';
import 'package:whatsapp/screens/user_details_screen.dart';

class IndividualChat extends StatefulWidget {
  static const id = "IndividualChat";
  // final String name;
  // const IndividualChat({required this.name});

  @override
  _IndividualChatState createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  TextEditingController _messageController = new TextEditingController();
  bool emojiShowing = false;

  messageBubble(String id, String message) {
    if (id == FirebaseAuth.instance.currentUser!.uid) {
      return BubbleNormal(
        text: message,
        isSender: true,
        color: Color(0xFFDCF7C4),
        tail: true,
        seen: true,
        sent: true,
        delivered: true,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      );
    } else {
      return BubbleNormal(
        text: message,
        isSender: false,
        color: Color(0xFFFFFFFF),
        tail: true,
        seen: true,
        sent: true,
        delivered: true,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      );
    }
  }

  _onEmojiSelected(Emoji emoji) {
    _messageController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _messageController.text.length));
  }

  _onBackspacePressed() {
    _messageController
      ..text = _messageController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _messageController.text.length));
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, UserDetails.id);
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  "images/default_dp.png",
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Name",
                style: TextStyle(
                    fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber("+917508693437");
              },
              icon: Icon(Icons.call)),
          Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.grey),
            ),
            child: ListTileTheme(
              child: PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case 'View contact':
                      {
                        //Navigator.pushNamed(context, NewGroupList.id);
                        break;
                      }
                    case 'Media, links and docs':
                      {
                        //Navigator.pushNamed(context, NewBroadcast.id);
                        break;
                      }
                    case 'Search':
                      {
                        //Navigator.pushNamed(context, LinkedDevices.id);
                        break;
                      }
                    case 'Mute notifications':
                      {
                        // Navigator.pushNamed(context, StarredMessages.id);
                        break;
                      }
                    case 'Wallpaper':
                      {
                        // Navigator.pushNamed(context, Payments.id);
                        break;
                      }
                    case 'More':
                      {
                        ListTileTheme(
                          child: PopupMenuButton(
                            onSelected: (value) {
                              switch (value) {
                                case 'Report':
                                  {
                                    //Navigator.pushNamed(context, NewGroupList.id);
                                    break;
                                  }
                                case 'Block':
                                  {
                                    //Navigator.pushNamed(context, NewBroadcast.id);
                                    break;
                                  }
                                case 'Clear chat':
                                  {
                                    //Navigator.pushNamed(context, LinkedDevices.id);
                                    break;
                                  }
                                case 'Export chat':
                                  {
                                    //Navigator.pushNamed(context, StarredMessages.id);
                                    break;
                                  }
                                case 'Add shortcut':
                                  {
                                    //Navigator.pushNamed(context, Payments.id);
                                    break;
                                  }
                              }
                            },
                            itemBuilder: (context) {
                              return {
                                'Report',
                                'Block',
                                'Clear chat',
                                'Export chat',
                                'Add shortcut',
                              }.map((String choice) {
                                return PopupMenuItem(
                                    value: choice, child: Text(choice));
                              }).toList();
                            },
                          ),
                        );
                      }
                  }
                },
                itemBuilder: (context) {
                  return {
                    'View contact',
                    'Media, links, and docs',
                    'Search',
                    'Mute notifications',
                    'Wallpaper',
                    'More'
                  }.map((String choice) {
                    return PopupMenuItem(value: choice, child: Text(choice));
                  }).toList();
                },
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/whatsAppBg.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ListView.builder(itemBuilder: (BuildContext context, int index) {
              //   return messageBubble(, )
              // })
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(width: 8.0),
                              IconButton(
                                icon: Icon(Icons.emoji_emotions),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    emojiShowing = !emojiShowing;
                                  });
                                },
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: TextField(
                                  onTap: () {
                                    setState(() {
                                      emojiShowing = false;
                                    });
                                  },
                                  controller: _messageController,
                                  decoration: InputDecoration(
                                    hintText: 'Type a message',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.attach_file,
                                size: 30.0,
                              ),
                              SizedBox(width: 8.0),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Scaffold(body: CameraScreen());
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(Icons.camera_alt),
                              ),
                              SizedBox(width: 8.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        child: Icon(Icons.send),
                      ),
                    ),
                  ],
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
        ],
      ),
    );
  }
}

// switch (value) {
//   case 'Report':
//     {
//       Navigator.pushNamed(context, NewGroupList.id);
//       break;
//     }
//   case 'Block':
//     {
//       Navigator.pushNamed(context, NewBroadcast.id);
//       break;
//     }
//   case 'Clear chat':
//     {
//       Navigator.pushNamed(context, LinkedDevices.id);
//       break;
//     }
//   case 'Export chat':
//     {
//       Navigator.pushNamed(context, StarredMessages.id);
//       break;
//     }
//   case 'Add shortcut':
//     {
//       Navigator.pushNamed(context, Payments.id);
//       break;
//     }
// }
