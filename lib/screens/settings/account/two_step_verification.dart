import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class TwoStepVerification extends StatelessWidget {
  static const id = 'two_step_verification';
  const TwoStepVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two-step verification'),
      ),
      body: Container(
        margin: EdgeInsets.all((MediaQuery.of(context).size.height * 0.035)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'For added security, enable two-step verification, which will require a PIN when registering your phone number with WhatsApp again.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'ENABLE',
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
