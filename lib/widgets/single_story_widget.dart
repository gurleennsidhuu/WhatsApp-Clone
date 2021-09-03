import 'package:flutter/material.dart';

class SingleStoryWidget extends StatefulWidget {
  const SingleStoryWidget({Key? key}) : super(key: key);

  @override
  _SingleStoryWidgetState createState() => _SingleStoryWidgetState();
}

class _SingleStoryWidgetState extends State<SingleStoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        children: [
          CircleAvatar(
              radius: 23, backgroundImage: AssetImage('images/default_dp.png')),
          SizedBox(
            width: 2,
          ),
          Column(
            children: [
              Text('UserName'),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [Text('Today, '), Text('10:15 pm')],
              )
            ],
          )
        ],
      ),
    );
  }
}
