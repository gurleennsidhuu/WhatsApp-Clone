import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class NewGroupList extends StatefulWidget {
  static const id = "NewGroup_list";
  const NewGroupList({Key? key}) : super(key: key);

  @override
  _NewGroupListState createState() => _NewGroupListState();
}

class _NewGroupListState extends State<NewGroupList> {
  Iterable<Contact> _contacts = [];

  Future<void> getContacts() async {
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('New group'), Text("Add participants")],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: _contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = _contacts.elementAt(index);
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                    leading:
                        (contact.avatar != null && contact.avatar!.isNotEmpty)
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
            ),
          ],
        ),
      ),
    );
  }
}
