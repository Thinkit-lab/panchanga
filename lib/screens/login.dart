import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panchanga_pandit/controllers/login_controller.dart';
import 'package:panchanga_pandit/screens/register.dart';
import 'package:panchanga_pandit/screens/homescreen.dart';
import 'package:panchanga_pandit/services/otp.dart';
// import 'package:panchanga_pandit/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late DateTime currentBackPressTime;
  String verificationIdFinal = "";
  String phoneNumber = '';
  late String phoneIsoCode;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
   setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }
  // AuthService authService = AuthService();
  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white
        // image: DecorationImage(
        //     image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(1.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: WillPopScope(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Container(
                      width: 100,
                      height: 150,
                      // child: Image.asset('assets/logo.jpeg'),
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: ()async{
                          
                          // await authService.verifyPhoneNumber(
                            // "$phoneIsoCode ${controller.text}", context, setData);
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Register()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.purple,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // Image.asset(
                                //   'assets/call.png',
                                //   height: 25.0,
                                //   fit: BoxFit.fitHeight,
                                // ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Continue with Mobile',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'We\'ll send OTP for Verification',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    
                    InkWell(
                      onTap: (){
                        loginController.login();
                        // await authService.googleSignIn(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.purple,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset(
                              //   'assets/google.png',
                              //   height: 25.0,
                              //   fit: BoxFit.fitHeight,
                              // ),
                              SizedBox(width: 10.0),
                              Text(
                                'Log in with Google',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onWillPop: () async {
                bool exitStatus = onWillPop();
                if (exitStatus) {
                  exit(0);
                }
                return false;
              },
            ),
          ),
        ],
      ),
    );
  }

  onWillPop() {
    return true;
  }
  void setData(String verificationId) {
    // setState(() {
    //   verificationIdFinal = verificationId;
    // });
    // startTimer();
  }
}
