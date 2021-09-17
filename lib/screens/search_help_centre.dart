import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class HelpCentre extends StatefulWidget {
  static const id = 'Help centre';
  const HelpCentre({Key? key}) : super(key: key);

  @override
  _HelpCentreState createState() => _HelpCentreState();
}

class _HelpCentreState extends State<HelpCentre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Help Centre'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          'Is this your question?',
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                            'IFCN Fact Checking Organizations on WhatsApp'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Stolen accounts'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                            'About registration and two-step verification'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('About UPI'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                            'How to migrate your WhatsApp data from iPhone to a Samsung phone'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                            "Can't migrate chat history from iPhone to a Samsung device"),
                      ),
                      Divider(),
                      ListTile(
                        title:
                            Text('How to reset your two-step verification PIN'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('How to receive money'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('How to change or set up new UPI PIN'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                            'Unauthorized use of automated or bulk messaging on WhatsApp'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('How to add a bank account'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('About supported operating systems'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('How to manage your notifications'),
                      ),
                      Divider(),
                      ListTile()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
            color: textColor,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "This doesn't answer my question",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
