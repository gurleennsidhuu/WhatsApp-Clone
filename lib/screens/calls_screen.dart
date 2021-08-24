import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/widgets/single_call_widget.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            callButton(),
            Column(
              children: [
                SingleCallWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

callButton() {
  return Positioned(
    right: 10,
    bottom: 15,
    child: Column(
      children: [
        Container(
          height: 45,
          width: 45,
          child: Icon(
            Icons.video_call,
            color: Colors.blueGrey,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 0.5,
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.1),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 55,
          width: 55,
          child: Icon(
            Icons.call,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: primaryColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 0.5,
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.1),
            ],
          ),
        )
      ],
    ),
  );
}
