import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp/screens/chat_screen.dart';
import 'package:whatsapp/screens/contact_list.dart';
import 'package:whatsapp/screens/contact_support.dart';
import 'package:whatsapp/screens/help_screen.dart';
import 'package:whatsapp/screens/home_screen.dart';
import 'package:whatsapp/screens/country_picker.dart';
import 'package:whatsapp/screens/individual_chat_screen.dart';
import 'package:whatsapp/screens/linkedDevices.dart';
import 'package:whatsapp/screens/newBroadcast.dart';
import 'package:whatsapp/screens/newGroup.dart';
import 'package:whatsapp/screens/opening_screen.dart';
import 'package:whatsapp/screens/payments.dart';
import 'package:whatsapp/screens/registration_screen.dart';
import 'package:whatsapp/screens/set_profile_screen.dart';
import 'package:whatsapp/screens/settings/account/account_settings.dart';
import 'package:whatsapp/screens/settings/account/change_number.dart';
import 'package:whatsapp/screens/settings/account/delete_my_account.dart';
import 'package:whatsapp/screens/settings/account/privacy.dart';
import 'package:whatsapp/screens/settings/account/request_acc_info.dart';
import 'package:whatsapp/screens/settings/account/security.dart';
import 'package:whatsapp/screens/settings/account/two_step_verification.dart';
import 'package:whatsapp/screens/settings/chats/chat_backup.dart';
import 'package:whatsapp/screens/settings/chats/chat_history.dart';
import 'package:whatsapp/screens/settings/chats/chats_main.dart';
import 'package:whatsapp/screens/settings/chats/dark_theme_wallpaper.dart';
import 'package:whatsapp/screens/settings/help/help.dart';
import 'package:whatsapp/screens/settings/main_setting_screen.dart';
import 'package:whatsapp/screens/settings/notifications/notification_main.dart';
import 'package:whatsapp/screens/settings/storage_and_data/storage_and_data_main.dart';
import 'package:whatsapp/screens/starredMessages.dart';
import 'package:whatsapp/screens/testScreen.dart';
import 'package:whatsapp/screens/user_details_screen.dart';

late final CameraController cameraController;
List<CameraDescription> cameras = [];

Future initCameraController(CameraDescription cameraDescription) async {
  cameraController.addListener(() {
    if (cameraController.value.hasError) {
      print('Camera error ${cameraController.value.errorDescription}');
    }
  });

  try {
    await cameraController.initialize();
  } on CameraException catch (e) {
    print(e);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Permission.contacts.request();
  availableCameras().then((availableCameras) {
    cameras = availableCameras;
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    initCameraController(cameras[0]).then((void v) {});
  }).catchError((err) {
    print('Error: $err.code\nError Message: $err.message');
  });
  runApp(ProviderScope(child: MyApp()));
}

User? firebaseUser = FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff075e54),
        indicatorColor: Colors.white,
        primaryColorDark: Color(0xFF128C7E),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? ChatScreen.id
          : OpeningScreen.id,
      //initialRoute: ContactSupport.id,
      routes: {
        OpeningScreen.id: (context) => OpeningScreen(),
        Registration.id: (context) => Registration(),
        SetProfile.id: (context) => SetProfile(),
        HomePage.id: (context) => HomePage(),
        HomeScreen.id: (context) => HomeScreen(),
        MainSettings.id: (context) => MainSettings(),
        AccountSettings.id: (context) => AccountSettings(),
        HelpSettings.id: (context) => HelpSettings(),
        Privacy.id: (context) => Privacy(),
        ChangeNumber.id: (context) => ChangeNumber(),
        DeleteMyAccount.id: (context) => DeleteMyAccount(),
        RequestAccInfo.id: (context) => RequestAccInfo(),
        Security.id: (context) => Security(),
        TwoStepVerification.id: (context) => TwoStepVerification(),
        DarkTheme.id: (context) => DarkTheme(),
        Chats.id: (context) => Chats(),
        ChatBackup.id: (context) => ChatBackup(),
        ChatHistory.id: (context) => ChatHistory(),
        NotificationScreen.id: (context) => NotificationScreen(),
        StorageAndData.id: (context) => StorageAndData(),
        HelpScreen.id: (context) => HelpScreen(),
        ContactSupport.id: (context) => ContactSupport(),
        ContactList.id: (context) => ContactList(),
        IndividualChat.id: (context) => IndividualChat(),
        NewGroupList.id: (context) => NewGroupList(),
        NewBroadcast.id: (context) => NewBroadcast(),
        LinkedDevices.id: (context) => LinkedDevices(),
        StarredMessages.id: (context) => StarredMessages(),
        Payments.id: (context) => Payments(),
        TestChat.id: (context) => TestChat(userId: "aplk"),
        UserDetails.id: (context) => UserDetails()
      },
    );
  }
}
