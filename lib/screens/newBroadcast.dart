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
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Text(
                'Only contacts with +91 75086 93437 in their address book will receive your broadcast messages.',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    fontWeight: FontWeight.w400),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            Divider(
              color: Colors.black,
            ),
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
