import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';

class StorageAndData extends StatelessWidget {
  static const id = 'storage_and_data';
  const StorageAndData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage and data'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: ListTile(
                leading: Icon(
                  Icons.folder,
                  color: iconColor,
                  size: MediaQuery.of(context).size.height * 0.03,
                ),
                title: Text(
                  'Manage storage',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
                subtitle: Text(
                  '10.5 GB',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.0185,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0002,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.data_usage,
                      color: iconColor,
                      size: MediaQuery.of(context).size.height * 0.03,
                    ),
                    title: Text(
                      'Network usage',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                      ),
                    ),
                    subtitle: Text(
                      '30.5 GB sent · 2.3 GB received',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0185,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.14),
                    child: ListTile(
                      title: Text(
                        'Use less data for calls',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                      trailing: Switch(
                        activeColor: Color(0xFF075E54),
                        inactiveTrackColor: Colors.grey,
                        value: true,
                        onChanged: (bool value) {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0002,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.17,
                      ),
                      Text(
                        'Media auto-download',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.17,
                      ),
                      Flexible(
                        child: Text(
                          'Voice messages are always automatically downloaded',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.13),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'When using mobile data',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                            ),
                          ),
                          subtitle: Text(
                            'Photos',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0185,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'When connected on Wi-Fi',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                            ),
                          ),
                          subtitle: Text(
                            'All media',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0185,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'When roaming',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                            ),
                          ),
                          subtitle: Text(
                            'No media',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.0185,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
