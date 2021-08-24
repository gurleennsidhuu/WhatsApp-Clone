import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

String bullet = "\u2022";

class DeleteMyAccount extends StatelessWidget {
  static const id = 'delete_my_account';
  const DeleteMyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete my account'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        color: Colors.red[700],
                        size: MediaQuery.of(context).size.height * 0.035,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                      ),
                      Text(
                        'Deleting your account will:',
                        style: TextStyle(
                            color: Colors.red[700],
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.125),
                    child: Text(
                      '$bullet Delete your account from WhatsApp\n\n'
                      '$bullet Erase your message history\n\n'
                      '$bullet Delete you from all of your WhatsApp groups\n\n'
                      '$bullet Delete your Google Drive backup\n\n'
                      '$bullet Delete your payments history and cancel any pending payments',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0002,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.send_to_mobile,
                        size: MediaQuery.of(context).size.height * 0.035,
                        color: iconColor,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                      ),
                      Text(
                        'Change number instead?',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: neonGreen),
                    onPressed: () {},
                    child: Text(
                      'CHANGE NUMBER',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0002,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.126),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        'To delete your account, confirm your country code and enter your phone number.'),
                    subtitle: Column(
                      children: [],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[700]),
                    onPressed: () {},
                    child: Text(
                      'DELETE MY ACCOUNT',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.017),
                    ),
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
