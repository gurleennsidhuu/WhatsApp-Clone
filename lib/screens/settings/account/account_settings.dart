import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/screens/settings/account/change_number.dart';
import 'package:whatsapp/screens/settings/account/delete_my_account.dart';
import 'package:whatsapp/screens/settings/account/privacy.dart';
import 'package:whatsapp/screens/settings/account/request_acc_info.dart';
import 'package:whatsapp/screens/settings/account/security.dart';
import 'package:whatsapp/screens/settings/account/two_step_verification.dart';

class AccountSettings extends StatelessWidget {
  static const id = 'account_settings';
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Privacy.id);
              },
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: iconColor,
                ),
                title: Text(
                  'Privacy',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Security.id);
              },
              child: ListTile(
                leading: Icon(
                  Icons.security,
                  color: iconColor,
                ),
                title: Text(
                  'Security',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, TwoStepVerification.id);
              },
              child: ListTile(
                leading: Icon(
                  Icons.indeterminate_check_box_rounded,
                  color: iconColor,
                ),
                title: Text(
                  'Two-step verification',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ChangeNumber.id);
              },
              child: ListTile(
                leading: Icon(
                  Icons.send_to_mobile,
                  color: iconColor,
                ),
                title: Text(
                  'Change number',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RequestAccInfo.id);
              },
              child: ListTile(
                leading: Icon(
                  Icons.insert_drive_file_rounded,
                  color: iconColor,
                ),
                title: Text(
                  'Request account info',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DeleteMyAccount.id);
              },
              child: ListTile(
                leading: Icon(
                  Icons.delete,
                  color: iconColor,
                ),
                title: Text(
                  'Delete my account',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
