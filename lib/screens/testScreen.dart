import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message extends StateNotifier<AsyncValue<String>> {
  Message() : super(AsyncLoading());
  Future<void> getData(String id) async {
    state = AsyncLoading();
    await FirebaseDatabase.instance
        .reference()
        .child('Messages')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(id)
        .onValue
        .listen((event) async {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        for (var m in snapshot.value['Message'].keys) messages.add(m);
      }
    });
  }
}

final messageNotifier =
    StateNotifierProvider<Message, AsyncValue<String>>((ref) {
  return Message();
});

class TestChat extends StatefulWidget {
  static const id = 'TestChat';
  final String userId;
  const TestChat({Key? key, required this.userId}) : super(key: key);

  @override
  _TestChatState createState() => _TestChatState();
}

List<String> messages = [];

class _TestChatState extends State<TestChat> {
  @override
  void initState() {
    Future.wait(
        [context.read(messageNotifier.notifier).getData(widget.userId)]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(messages[index]),
            );
          }),
    );
  }
}
