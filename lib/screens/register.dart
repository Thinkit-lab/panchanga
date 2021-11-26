import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panchanga_pandit/services/otp.dart';
import 'package:panchanga_pandit/services/auth.dart';
import 'package:date_time_picker/date_time_picker.dart';

// import 'package:international_phone_input/international_phone_input.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      // _phone = internationalizedPhoneNumber;
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }
  AuthService authService = AuthService();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _date = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //textfield state
  late String email;
  late String password;
  late String username;
  late String confirmPassword;
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
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                      width: 100,
                      height: 150,
                      child: Image.asset('assets/logo.jpeg'),
                    ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  //   child: Text(
                  //     'Register',
                  //     style: TextStyle(
                  //       color: Colors.purple,
                  //       fontSize: 30.0,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10.0),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0),
                  //   child: Text(
                  //     'Create account',
                  //     style: TextStyle(
                  //       color: Colors.purple,
                  //       fontSize: 16.0,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 50.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200]!.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextFormField(
                          validator: (val)=> val!.isEmpty ? 'Enter Username' : null,
                          cursorColor: Colors.purple,
                          controller: _username,
                          onChanged: (val){
                            setState(() {
                              username = val;
                            });
                          },
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20.0),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: Colors.purple,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextFormField(
                        validator: (val)=> val!.isEmpty ? 'Enter an email' : null,
                        cursorColor: Colors.purple,
                        controller: _email,
                        onChanged: (val){
                          setState(() {
                            email = val;
                          });
                        },
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20.0),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200]!.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: InternationalPhoneNumberInput(onInputChanged: (value){
                          phoneNumber=value.phoneNumber!;
                           print("my phone $phoneNumber");   
                        },
                          textStyle: TextStyle(
                            color: Colors.purple,
                            // color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          initialValue: number,
                          textFieldController: controller,
                          inputBorder: InputBorder.none,
                          inputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20.0),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.purple,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          // selectorType: PhoneInputSelectorType.DIALOG,
                        ),
                      ),
                    ),
                    // SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextFormField(
                        validator: (val)=> val!.length < 6 ? 'Enter a valid password 6+ chars long' : null,
                        cursorColor: Colors.purple,
                        controller: _password,
                        onChanged: (val){
                          setState(() {
                            password = val;
                          });
                        },
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextFormField(
                        validator: (val){
                          if(val==password){
                            return null;
                          }else{
                            return 'password do not match';
                          }
                        },
                        cursorColor: Colors.purple,
                        controller: _confirmPassword,
                        onChanged: (val){
                          setState(() {
                            confirmPassword = val;
                          });
                        },
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: DateTimePicker(
                        controller: _date,
                        initialValue: null,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Date',
                          hintStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                        // dateLabelText: 'Date',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30.0),
                      onTap: () async{
                        // if(_formKey.currentState.validate()){
                          await authService.verifyPhoneNumber(
                            phoneNumber, context, setData);
                           Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: OTPScreen()));
                        // }
                       
                      },
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                            stops: [0.1, 0.5, 0.9],
                            colors: [
                              Colors.purple[300]!.withOpacity(0.8),
                              Colors.purple[500]!.withOpacity(0.8),
                              Colors.purple[800]!.withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: Text(
                          'Send OTP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                    ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
   void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    // startTimer();
  }
}
