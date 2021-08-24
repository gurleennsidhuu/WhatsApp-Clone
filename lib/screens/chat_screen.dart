import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp/screens/contact_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/widgets/single_chat_widget.dart';

class UserData {
  String? uid;
  String? name;
  String? profilePicture;

  UserData({
    this.uid,
    this.name,
    this.profilePicture,
  });
}

List<UserData> messages = [];

class Messages extends StateNotifier<AsyncValue<List<String>>> {
  Messages() : super(AsyncLoading());
  Future<void> getMessages() async {
    state = AsyncLoading();
    final fetchedMessages = await FirebaseDatabase.instance
        .reference()
        .child('Messages')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .once()
        .then((data) => data.value)
        .onError((error, stackTrace) => state = AsyncError(error!));
    if (fetchedMessages != null) {
      for (var message in fetchedMessages.values) {
        print(message["uid"].toString());
        FirebaseDatabase.instance
            .reference()
            .child('User')
            .child(message["uid"].toString())
            .onValue
            .listen((event) async {
          var snapshot = event.snapshot;
          if (snapshot.value != null) {
            messages.add(UserData(
                uid: message["uid"].toString(),
                name: snapshot.value["name"].toString(),
                profilePicture: snapshot.value["photoUrl"].toString()));
            print(snapshot.value["name"].toString());
          }
        });
      }
    }
  }
}

final userDataNotifier =
    StateNotifierProvider<Messages, AsyncValue<List<String>>>((ref) {
  return Messages();
});

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  contactPermission() async {
    if (await Permission.contacts.isDenied ||
        await Permission.contacts.isGranted != true) {
      Permission.contacts.request();
    }
  }

  @override
  void initState() {
    contactPermission();
    Future.wait([context.read(userDataNotifier.notifier).getMessages()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final userData = watch(userDataNotifier);
      return Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleChatWidget(
                  userId: messages[index].uid,
                  name: messages[index].name,
                  dp: messages[index].profilePicture);
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.72,
            left: MediaQuery.of(context).size.width * 0.8,
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, ContactList.id);
              },
              child: Icon(Icons.chat),
            ),
          ),
        ],
      );
    });
  }
}
