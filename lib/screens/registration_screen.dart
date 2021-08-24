import 'package:country_pickers/country.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/screens/country_picker.dart';
import 'package:whatsapp/screens/help_screen.dart';
import 'package:whatsapp/screens/verification_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:country_picker/country_picker.dart';

class Registration extends StatefulWidget {
  static const id = 'verification_screen';
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //Country _countryPicker = CountryPickerUtils.getCountryByPhoneCode("91");
  String _countryCode = "";
  String mobileNumber = "";
  TextEditingController phone = TextEditingController();

  late final selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.17),
          child: Text(
            'Enter your phone number',
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.grey),
            ),
            child: ListTileTheme(
              child: PopupMenuButton(onSelected: (value) {
                Navigator.pushNamed(context, HelpScreen.id);
              }, itemBuilder: (context) {
                return {'Help'}.map((String choice) {
                  return PopupMenuItem(value: choice, child: Text(choice));
                }).toList();
              }),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.height * 0.05,
            right: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.04),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'WhatsApp will send an SMS to verify your phone number.'),
                      TextSpan(
                        text: "What's my number?",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            bool check = await Permission.phone.isGranted;
                            if (await Permission.phone.isGranted) {
                              final String? mobNumber =
                                  await MobileNumber.mobileNumber;
                              if (mobileNumber == null) {
                                Fluttertoast.showToast(
                                    msg:
                                        "SIM not found. Please check that you have a SIM on your device or type in your number",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              } else {
                                mobileNumber = mobNumber!;
                              }
                            } else {
                              AlertDialog alert = AlertDialog(
                                titlePadding: EdgeInsets.zero,
                                title: Container(
                                  width: double.infinity,
                                  color: iconColor,
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.04),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                ),
                                content: Text(
                                  "To retrieve your phone number, WhatsApp needs permissions to make and manage your calls. Without this permission, WhatsApp will be unable to retrieve your phone number from the SIM.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'NOT NOW',
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      if (!await Permission.phone.isGranted) {
                                        openAppSettings();
                                      }
                                      // if (await Permission.phone.isGranted) {
                                      //   final String? mobileNumber =
                                      //       await MobileNumber.mobileNumber;
                                      //   if (mobileNumber == null) {
                                      //     Fluttertoast.showToast(
                                      //         msg:
                                      //             "SIM not found. Please check that you have a SIM on your device or type in your number",
                                      //         toastLength: Toast.LENGTH_SHORT,
                                      //         gravity: ToastGravity.BOTTOM,
                                      //         timeInSecForIosWeb: 2,
                                      //         backgroundColor: Colors.grey,
                                      //         textColor: Colors.black,
                                      //         fontSize: 16.0);
                                      //   }
                                      // }
                                    },
                                    child: Text(
                                      'SETTINGS',
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                            }
                          },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                  //title: country,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1.5, color: greenColor)),
                      ),
                      height: 40,
                      width: 70,
                      child: TextField(
                        maxLength: 3,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 9),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: greenColor),
                          ),
                          counterText: "",
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 25,
                            minHeight: 25,
                          ),
                          prefixIcon: SizedBox(
                            child: Text(
                              '+',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.023),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) async {
                          _countryCode = value;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1.5, color: greenColor)),
                      ),
                      height: 40,
                      width: 150,
                      child: TextField(
                        controller: phone,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2, color: greenColor),
                          ),
                          counterText: "",
                          hintText: 'phone number',
                        ),
                        onChanged: (value) async {
                          if (phone.text.length == 5) {
                            phone.value = TextEditingValue(
                                text: phone.text + " ",
                                selection: TextSelection.fromPosition(
                                  TextPosition(offset: 6),
                                ));
                          }
                          mobileNumber = value;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Carrier SMS charges may apply',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_countryCode.length > 3 || _countryCode.length == 0) {
                  AlertDialog invalid = AlertDialog(
                    title: Text(
                      'Invalid country code length (1-3 digits only).',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: iconColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return invalid;
                    },
                  );
                } else if (mobileNumber.length == 0) {
                  AlertDialog mob = AlertDialog(
                    title: Text(
                      'Please enter your phone number.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: iconColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mob;
                    },
                  );
                } else {
                  AlertDialog alert = AlertDialog(
                    title: Text(
                      'You entered the phone number:',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '+$_countryCode $mobileNumber',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.018,
                          ),
                          Text(
                            'Is this OK, or would you like to edit the number?',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text(
                              'EDIT',
                              style: TextStyle(
                                  color: iconColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerificationScreen(
                                          mobileNumber, _countryCode)));
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: iconColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }
                // Navigator.pushNamed(context, VerificationScreen.id);
              },
              child: Text(
                'NEXT',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
              style: ElevatedButton.styleFrom(
                primary: neonGreen,
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.08,
                    MediaQuery.of(context).size.height * 0.02,
                    MediaQuery.of(context).size.width * 0.08,
                    MediaQuery.of(context).size.height * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
