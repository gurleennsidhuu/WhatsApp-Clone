import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/screens/settings/account/account_settings.dart';
import 'package:whatsapp/screens/settings/help/help.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserData {
  String? name;
  String? bio;
  String? profilePicture;

  UserData({
    this.name,
    this.bio,
    this.profilePicture,
  });
}

class UserInfo extends StateNotifier<AsyncValue<UserData>> {
  UserInfo() : super(AsyncLoading());
  Future<void> getData() async {
    state = AsyncLoading();
    await FirebaseDatabase.instance
        .reference()
        .child('User')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .onValue
        .listen((event) async {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        state = AsyncData(
          UserData(
            name: snapshot.value['name'].toString(),
            bio: snapshot.value['bio'].toString(),
            profilePicture: snapshot.value['imageUrl'],
          ),
        );
      }
    });
  }
}

final userDataNotifier =
    StateNotifierProvider<UserInfo, AsyncValue<UserData>>((ref) {
  return UserInfo();
});

class MainSettings extends StatefulWidget {
  static const id = 'Main_Settings';
  const MainSettings({Key? key}) : super(key: key);

  @override
  _MainSettingsState createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  @override
  void initState() {
    super.initState();
    Future.wait([context.read(userDataNotifier.notifier).getData()]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final userData = watch(userDataNotifier);
      return userData.map(
          data: (userData) => SafeArea(
                child: DefaultTabController(
                  length: 1,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ),
                    body: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.018),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.09),
                                  child: //userData.value.profilePicture==null?
                                      Image.asset(
                                    'images/default_dp.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.height *
                                        0.05,
                                  ), //:Image.file(file),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData.value.name!,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.024,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      userData.value.bio!,
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text('QR CODE')
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height:
                                MediaQuery.of(context).size.height * 0.00045,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.018),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AccountSettings.id);
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      'images/key.png',
                                      color: iconColor,
                                    ),
                                    title: Text(
                                      'Account',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Privacy, security, change number',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.chat,
                                      color: iconColor,
                                    ),
                                    title: Text(
                                      'Chats',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Theme, wallpapers, chat history',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: ListTile(
                                    leading: Image.asset(
                                      'images/bell.png',
                                      color: iconColor,
                                    ),
                                    title: Text(
                                      'Notifications',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Message, group & call tones',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: ListTile(
                                    leading: Image.asset(
                                      'images/key.png',
                                      color: iconColor,
                                    ),
                                    title: Text(
                                      'Storage and data',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Network usage, auto-download',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, HelpSettings.id);
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      'images/help.png',
                                      color: iconColor,
                                    ),
                                    title: Text(
                                      'Help',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Help centre, contact us, privacy policy',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height *
                                      0.0004,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                GestureDetector(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.supervisor_account,
                                      color: iconColor,
                                      size: MediaQuery.of(context).size.height *
                                          0.04,
                                    ),
                                    title: Text(
                                      'Invite a friend',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'from',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                    Text(
                                      'FACEBOOK',
                                      style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          letterSpacing: 5,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          loading: (_) => Scaffold(
                body: Container(
                  child: Text("Loading"),
                ),
              ),
          error: (_) => Container(
                child: Text("Error"),
              ));
    });
  }
}
