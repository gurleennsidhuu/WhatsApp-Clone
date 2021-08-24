import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class ChatHistory extends StatelessWidget {
  static const id = 'chat_history';
  const ChatHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat history'),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.arrow_upward_outlined,
                color: iconColor,
                size: MediaQuery.of(context).size.height * 0.034,
              ),
              title: Text(
                'Export Chat',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.archive,
                color: iconColor,
                size: MediaQuery.of(context).size.height * 0.034,
              ),
              title: Text(
                'Archive all chats',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.remove_circle_outline,
                color: iconColor,
                size: MediaQuery.of(context).size.height * 0.034,
              ),
              title: Text(
                'Clear all chats',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: iconColor,
                size: MediaQuery.of(context).size.height * 0.034,
              ),
              title: Text(
                'Delete all chats',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
