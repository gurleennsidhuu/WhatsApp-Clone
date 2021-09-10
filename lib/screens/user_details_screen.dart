import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class UserDetails extends StatefulWidget {
  static final id = 'User_details';
  const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/default_dp.png'),
                ),
              ),
            ),
            Text('Media, links, and docs'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Mute notifications'),
                    trailing: Switch(
                      onChanged: (bool value) {},
                      value: false,
                    ),
                  ),
                  ListTile(
                    title: Text('Custom notifications'),
                  ),
                  ListTile(
                    title: Text('Media visibility'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Disappearing messages'),
                    subtitle: Text('Off'),
                    trailing: Switch(
                      onChanged: (bool value) {},
                      value: false,
                    ),
                  ),
                  ListTile(
                    title: Text('Encryption'),
                    subtitle: Text(
                        'Messages and calls are end-to-end encrypted. Tap to verify.'),
                    trailing: Icon(Icons.lock),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'About and phone number',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  ListTile(
                    title: Text('Available'),
                    subtitle: Text('29 November 2020'),
                  ),
                  ListTile(
                    title: Text('+917508693437'),
                    subtitle: Text('Mobile'),
                    trailing: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.videocam),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Groups in common',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('images/default_dp.png'),
                    title: Text('Group name'),
                    subtitle: Text('Members list'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(
                    Icons.block,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Block',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Report contact',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
