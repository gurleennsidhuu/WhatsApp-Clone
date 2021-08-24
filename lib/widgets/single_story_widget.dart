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
      child: Row(
        children: [
          Image.asset('images/default_dp.png'),
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
