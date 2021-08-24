import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/constants/color_constants.dart';

class HelpSettings extends StatelessWidget {
  static const id = 'help_settings';
  const HelpSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await launch(
                  'https://faq.whatsapp.com/android?lg=en&lc=GB&eea=0&anid=3bbd9f78-c525-478a-adfc-88ee8f05ea79',
                  forceSafariVC: false,
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: iconColor,
                ),
                title: Text(
                  'Help Centre',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.supervisor_account,
                color: iconColor,
              ),
              title: Text(
                'Contact us',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                ),
              ),
              subtitle: Text('Questions? Need help?'),
            ),
            GestureDetector(
              onTap: () async {
                await launch(
                  'https://www.whatsapp.com/legal/?lg=en&lc=GB&eea=0',
                  forceSafariVC: false,
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.insert_drive_file_rounded,
                  color: iconColor,
                ),
                title: Text(
                  'Terms and Privacy Policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: iconColor,
              ),
              title: Text(
                'App info',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
