import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:whatsapp/screens/chat_screen.dart';

class NewBroadcast extends StatefulWidget {
  static const id = "NewBroadcast";
  const NewBroadcast({Key? key}) : super(key: key);

  @override
  _NewBroadcastState createState() => _NewBroadcastState();
}

class _NewBroadcastState extends State<NewBroadcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('New Broadcast'), Text("${contacts.length}")],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/default_dp.png'),
                    ),
                    title: Text("New group"),
                  ),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/default_dp.png'),
                    ),
                    title: Text("New contact"),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      Contact contact = contacts.elementAt(index);
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 18),
                        leading: (contact.avatar != null &&
                                contact.avatar!.isNotEmpty)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar!),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    AssetImage("images/default_dp.png"),
                              ),
                        title: Text(contact.displayName ?? ''),
                        subtitle: Text(""),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
