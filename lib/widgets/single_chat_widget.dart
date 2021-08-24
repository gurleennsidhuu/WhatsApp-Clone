import 'package:flutter/material.dart';
import 'package:whatsapp/screens/individual_chat_screen.dart';

class SingleChatWidget extends StatefulWidget {
  final String? userId;
  final String? name;
  final String? dp;
  const SingleChatWidget(
      {Key? key, required this.userId, required this.name, required this.dp})
      : super(key: key);

  @override
  _SingleChatWidgetState createState() => _SingleChatWidgetState();
}

class _SingleChatWidgetState extends State<SingleChatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset('images/default_dp.png'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.name!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Hi there, I am using whatsApp',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ],
                ),
                Text("12:47 AM"),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return IndividualChat();
        }));
      },
    );
  }
}
