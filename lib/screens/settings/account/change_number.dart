import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class ChangeNumber extends StatelessWidget {
  static const id = 'change_number';
  const ChangeNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Number'),
      ),
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.023),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Changing your phone number will migrate your account info, groups & settings.',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.022),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                Text(
                  'Before proceeding, please confirm that you are able to receive SMS or calls at your new number.',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                Text(
                  'If you have both a new phone & a new number, first change your number on your old phone.',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      color: Colors.black54),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'NEXT',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
              style: ElevatedButton.styleFrom(
                primary: neonGreen,
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.height * 0.025,
                    MediaQuery.of(context).size.height * 0.02,
                    MediaQuery.of(context).size.height * 0.025,
                    MediaQuery.of(context).size.height * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
