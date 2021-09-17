import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';
import 'package:whatsapp/constants/color_constants.dart';
import 'package:whatsapp/screens/help_screen.dart';
import 'package:whatsapp/screens/home_screen.dart';
import 'package:whatsapp/screens/set_profile_screen.dart';
import 'package:whatsapp/services/authservices.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class VerificationScreen extends StatefulWidget {
  static const id = 'verification';
  final String countryCode;
  final String mobileNumber;
  const VerificationScreen(this.mobileNumber, this.countryCode);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

String _otp = "";
int resendToken = 0;
int _sec = 2;
int _min = 1;
TextEditingController _pincodeController = new TextEditingController();
NumberFormat formatter = new NumberFormat("00");

class _VerificationScreenState extends State<VerificationScreen> {
  late String verificationId, smsCode;
  late Timer _timer;
  bool codeSent = false;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_min == 0 && _sec == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _sec--;
            if (_sec == 0) {
              if (_min != 0) _sec = 59;
              if (_min > 0) _min--;
            }
          });
        }
      },
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
        startTimer();
        resendToken = forceResend!;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 30, minutes: 1),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout,
        forceResendingToken: resendToken);
  }

  @override
  void dispose() {
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print("${formatter.format(_min)} : ${formatter.format(_sec)}");
    verifyPhone(
        "+${widget.countryCode}${widget.mobileNumber.substring(0, 5) + widget.mobileNumber.substring(6, 11)}");
    super.initState();
  }

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
            'Verify +${widget.countryCode} ${widget.mobileNumber}',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      color: Colors.black87,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Waiting to automatically direct an SMS to +'),
                      TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        text: "${widget.countryCode} ${widget.mobileNumber}.",
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                    text: 'Wrong number?',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 40,
                    style: TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      _otp = pin;
                      FirebaseAuth auth = FirebaseAuth.instance;
                      AuthCredential _credential = PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: pin);
                      auth
                          .signInWithCredential(_credential)
                          .then((UserCredential result) async {
                        var snapshot = await FirebaseDatabase.instance
                            .reference()
                            .child('User')
                            .child(FirebaseAuth.instance.currentUser!.uid)
                            .once();
                        if (snapshot.value != null)
                          Navigator.pushNamed(context, HomeScreen.id);
                        else {
                          FirebaseDatabase.instance
                              .reference()
                              .child('User')
                              .child(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                            'uid': FirebaseAuth.instance.currentUser!.uid,
                            'phoneNo':
                                "${widget.countryCode}${widget.mobileNumber.substring(0, 5) + widget.mobileNumber.substring(6, 11)}"
                          });
                          Navigator.pushNamed(context, SetProfile.id);
                        }
                      }).catchError((e) {
                        Fluttertoast.showToast(
                            msg: "Incorrect OTP",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                  ),
                ),
                Text(
                  'Enter 6-digit code',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.015),
                  child: AbsorbPointer(
                    absorbing: _min == 0 && _sec == 0,
                    child: GestureDetector(
                      onTap: () {
                        verifyPhone(
                            "+${widget.countryCode}${widget.mobileNumber.substring(0, 5) + widget.mobileNumber.substring(6, 11)}");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.sms,
                                color: _min == 0 && _sec == 0
                                    ? textColor
                                    : Color(0xFFA2C8B6),
                                size:
                                    MediaQuery.of(context).size.height * 0.033,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Text(
                                'Resend SMS',
                                style: TextStyle(
                                  color: _min == 0 && _sec == 0
                                      ? textColor
                                      : Color(0xFFA2C8B6),
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.021,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                              "${formatter.format(_min)} : ${formatter.format(_sec)}"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0003,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.015),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: _min == 0 && _sec == 0
                            ? textColor
                            : Color(0xFFA2C8B6),
                        size: MediaQuery.of(context).size.height * 0.033,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Text(
                        'Call me',
                        style: TextStyle(
                          color: _min == 0 && _sec == 0
                              ? textColor
                              : Color(0xFFA2C8B6),
                          fontSize: MediaQuery.of(context).size.height * 0.021,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_otp.length == 6) {
                  AuthCredential _credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: _otp);
                  FirebaseAuth.instance
                      .signInWithCredential(_credential)
                      .then((UserCredential result) async {
                    var snapshot = await FirebaseDatabase.instance
                        .reference()
                        .child('User')
                        .child(FirebaseAuth.instance.currentUser!.uid)
                        .once();
                    if (snapshot.value != null)
                      Navigator.pushNamed(context, HomeScreen.id);
                    else {
                      FirebaseDatabase.instance
                          .reference()
                          .child('User')
                          .child(FirebaseAuth.instance.currentUser!.uid)
                          .set({
                        'uid': FirebaseAuth.instance.currentUser!.uid,
                        'phoneNo':
                            "${widget.countryCode}${widget.mobileNumber.substring(0, 5) + widget.mobileNumber.substring(6, 11)}"
                      });
                      Navigator.pushNamed(context, SetProfile.id);
                    }
                  }).catchError((e) {
                    Fluttertoast.showToast(
                        msg: "Incorrect OTP",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                }
              },
              child: Text(
                'NEXT',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
              style: ElevatedButton.styleFrom(
                primary: greenColor,
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
