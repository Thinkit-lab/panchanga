import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panchanga_pandit/models/usermodel.dart';
import 'package:panchanga_pandit/screens/homescreen.dart';
import 'package:panchanga_pandit/services/dataBase.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> gender = ['Male', 'Female'];

  // form values
  late String _currentName;
  late String _currentGender;
  late String _currentDob;
  late String _currentbirthTime;
  late String _currentbirthPlace;

  @override
  Widget build(BuildContext context) {

    // User user = Provider.of<User>(context);
    FirebaseAuth firebaseAuth =FirebaseAuth.instance;

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: firebaseAuth.currentUser!.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData? userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your brew settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData!.name, 
                  validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField(
                  value: _currentGender,
                  items: gender.map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text('$gender'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentGender = val.toString() ),
                ),
                SizedBox(height: 10.0),
              
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      await DatabaseService(uid: firebaseAuth.currentUser!.uid).updateUserData(
                        _currentName, 
                        _currentGender, 
                        _currentDob, 
                        // _currentbirthTime ?? snapshot.data!.birthTime,
                        // _currentbirthPlace ?? snapshot.data.name, 
                      );
                     Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: HomeScreen()));
                    }
                  }
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      }
    );
  }
}