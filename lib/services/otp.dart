import 'dart:async';

import 'package:panchanga_pandit/screens/login.dart';
import 'package:panchanga_pandit/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int start = 30;
  bool wait = true;
  String buttonName = "Resend";
  TextEditingController phoneController = TextEditingController();
  AuthService authService = AuthService();
  String verificationIdFinal = "";
  String smsCode = "";
  Login login = Login();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Verify OTP",
          style: TextStyle(color: Colors.black, fontSize: 22,),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 120,
                height: 120,
                child: Image.asset('assets/logo.jpeg'),
              ),
              SizedBox(
                height: 40,
              ),
              // textField(),
              Text(
                'Verification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.purple.shade600,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Enter your verification code",
                      style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.purple.shade600,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              otpField(),
              SizedBox(
                height: 40,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Send OTP again in ",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: TextStyle(fontSize: 16, color: Colors.purple,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " sec ",
                      style: TextStyle(fontSize: 16, color: Colors.purple),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 20,
              ),
              button(),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  authService.signInwithPhoneNumber(
                      verificationIdFinal, smsCode, context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OTPTextField(
          length: 6,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 40,
          otpFieldStyle: OtpFieldStyle(
      backgroundColor: Colors.grey.shade200,
      borderColor: Colors.white,
          ),
          style: TextStyle(fontSize: 17, color: Colors.white),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
      print("Completed: " + pin);
      setState(() {
        smsCode = pin;
      });
          },
        ),
    );
  }

  Widget button(){
    return InkWell(
            onTap: wait
                ? null
                : () async {
                    setState(() {
                      start = 30;
                      wait = false;
                      buttonName = "Request OTP";
                    });
                    // await authService.verifyPhoneNumber(
                    //     "+91 ${phoneController.text}", context, setData);
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                buttonName,
                style: TextStyle(
                  color: wait ? Colors.black54 : Colors.purple,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }

  // Widget textField() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width - 40,
  //     height: 60,
  //     decoration: BoxDecoration(
  //       color: Color(0xff1d1d1d),
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: TextFormField(
  //       controller: phoneController,
  //       style: TextStyle(color: Colors.white, fontSize: 17),
  //       keyboardType: TextInputType.number,
  //       decoration: InputDecoration(
  //         border: InputBorder.none,
  //         hintText: "Enter your phone Number",
  //         hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
  //         contentPadding:
  //             const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
  //         prefixIcon: Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
  //           child: Text(
  //             " (+91) ",
  //             style: TextStyle(color: Colors.white, fontSize: 17),
  //           ),
  //         ),
  //         suffixIcon: InkWell(
  //           onTap: wait
  //               ? null
  //               : () async {
  //                   setState(() {
  //                     start = 30;
  //                     wait = true;
  //                     buttonName = "Resend";
  //                   });
  //                   // await authService.verifyPhoneNumber(
  //                   //     "+91 ${phoneController.text}", context, setData);
  //                 },
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
  //             child: Text(
  //               buttonName,
  //               style: TextStyle(
  //                 color: wait ? Colors.grey : Colors.white,
  //                 fontSize: 17,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}