import 'package:flutter/material.dart';

class StarredMessages extends StatefulWidget {
  static const id = 'StarredMessages';
  const StarredMessages({Key? key}) : super(key: key);

  @override
  _StarredMessagesState createState() => _StarredMessagesState();
}

class _StarredMessagesState extends State<StarredMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starred Messages'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            //onSelected: (){},
            itemBuilder: (BuildContext context) {
              return {'Unstar all'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
