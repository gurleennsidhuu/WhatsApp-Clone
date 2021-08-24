import 'package:flutter/material.dart';

class LinkedDevices extends StatefulWidget {
  static const id = 'linkedDevices';
  const LinkedDevices({Key? key}) : super(key: key);

  @override
  _LinkedDevicesState createState() => _LinkedDevicesState();
}

class _LinkedDevicesState extends State<LinkedDevices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linked devices'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text('Use WhatsApp on other devices'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('LINK A DEVICE'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Column(
                children: [
                  Text('DEVICE STATUS'),
                  Text('Tap a device to log out.'),
                  ListTile(
                    leading: Icon(Icons.window),
                    title: Text('Windows'),
                    subtitle: Text('Last active 16 August, 11:10 pm'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
