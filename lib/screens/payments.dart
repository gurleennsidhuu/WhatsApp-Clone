import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  static const id = 'Payments';
  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [Text('History')],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Column(
                children: [
                  Text('Payment methods'),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text(
                        'To protect your security, WhatsApp does not store your UPI PIN or full bank account number'),
                    subtitle: TextButton(
                      child: Text('Learn more'),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_circle_outline),
                    title: Text('Add payment method'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.help_outline_rounded),
                title: Text('Help'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [Text(' Rupee icon'), Text('NEW PAYMENT')],
        ),
      ),
    );
  }
}
