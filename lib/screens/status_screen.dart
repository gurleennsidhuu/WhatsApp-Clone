import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/widgets/single_story_widget.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/default_dp.png'),
                              radius: 35,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My status',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Tap to add status update"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Text('Recent Updates'),
              ),
              SizedBox(
                height: 8,
              ),
              SingleStoryWidget(),
              SizedBox(
                height: 8,
              ),
              SingleStoryWidget(),
            ],
          ),
          addStoryButton(),
        ],
      ),
    );
  }
}

addStoryButton() {
  return Positioned(
    right: 10,
    bottom: 15,
    child: Column(
      children: [
        Container(
          height: 45,
          width: 45,
          child: Icon(
            Icons.edit,
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
            Icons.camera_alt,
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
