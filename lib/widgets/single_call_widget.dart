import 'package:flutter/material.dart';

class SingleCallWidget extends StatefulWidget {
  const SingleCallWidget({Key? key}) : super(key: key);

  @override
  _SingleCallWidgetState createState() => _SingleCallWidgetState();
}

class _SingleCallWidgetState extends State<SingleCallWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/default_dp.png')),
          ),
          SizedBox(
            width: 2,
          ),
          Column(
            children: [
              Text('7508643437'),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Icon(Icons.call_received),
                  SizedBox(
                    width: 2,
                  ),
                  Text('Today, '),
                  Text('11:00 am'),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }
}
