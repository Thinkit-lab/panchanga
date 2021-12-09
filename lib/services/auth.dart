import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panchanga_pandit/screens/edit_profile.dart';
import 'package:panchanga_pandit/screens/homescreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dataBase.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final storage = new FlutterSecureStorage();
  

  Future<String> createAccount({required String email, required String password}) async{
    try {
      await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return 'Account created';
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    return 'The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    return 'The account already exists for that email.';
  }
} catch (e) {
  return 'Error creating account';
}
return 'Success';
  }

//Sign In
Future<String> signIn({required String email, required String password}) async{
  try {
    await _auth.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return 'Success';
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    return 'No user found for that email.';
  } else if (e.code == 'wrong-password') {
    return 'Wrong password provided for that user.';
  }
}
return 'Success';
}
//Sign Out
// Future <void> signOut() async{
//   try{
//     await _googleSignIn.signOut();
//   await _auth.signOut();
//   await storage.delete(key: 'token');
//   }
//   catch(e){

//   }

// }
final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final storage = new FlutterSecureStorage();
  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      if (googleSignInAccount != null) {
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        storeTokenAndData(userCredential);
        await  DatabaseService(uid: userCredential.user!.uid).updateUserData('new crew member', 'Male', '09/01/1995','9:00 PM','');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => SettingsForm()),
            (route) => false);

        // final snackBar =
            // SnackBar(content: Text(userCredential.user!.uid));
        // ignore: unnecessary_statements
        // ScaffoldMessenger.of(context).showSnackBar;
      }
    } catch (e) {
      print("here---->");
      final snackBar = SnackBar(content: Text(e.toString()));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await storage.delete(key: "token");
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void storeTokenAndData(UserCredential userCredential) async {
    print("storing token and data");
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out");
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => HomeScreen()),
          (route) => false);

      showSnackBar(context, "logged In");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  
  }