import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panchanga_pandit/screens/edit_profile.dart';
import 'package:panchanga_pandit/services/auth.dart';
import 'package:panchanga_pandit/services/dataBase.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseService databaseService = DatabaseService(uid: '');
 final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String ? name;
  String ? gender;
  String ? dob;
  String ? birthTime;
  String ? birthPlace;
  String ? lat;
  String ? lng;
  String ? timezone;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[200]!.withOpacity(0.5),
          child: Icon(Platform.isIOS?Icons.arrow_back_ios : Icons.arrow_back,),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => SettingsForm()),
            (route) => false);

          },
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, .9),
      body: Center(
        child: FutureBuilder(
          future: getUserById(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            else return
            ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    width: double.infinity,
                    height: 330,
                    // color: Colors.deepOrange,
                  ),
                  Positioned(
                    top: 10,
                    right: 30,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.all(14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              // height: 90,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 40),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                // child: PNetworkImage(rocket),
                              )
                            ),
                            Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Text(
                        "$name",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Text(
                        "$gender",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30,),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text("Date of Birth",
                                          style: TextStyle(
                                              color: Colors.white))),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text("$dob",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16))),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 5),
                                      child: Text("Birth Time",
                                          style: TextStyle(
                                              color: Colors.white))),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text("$birthTime",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Other Information",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(Icons.my_location),
                        title: Text("Birth Place"),
                        subtitle: Text("$birthPlace"),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Longitude"),
                        subtitle: Text("$lng"),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Latitude"),
                        subtitle: Text("$lat"),
                      ),
                      ListTile(
                        leading: Icon(Icons.timeline),
                        title: Text("Time Zone"),
                        subtitle: Text(
                            "$timezone"),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    )
                    ],
                  )
                ],
              ),
            ],
          );
          },
        ),
      ),
    );
  }
  


  getUserById () async {
    
    await userCollection.doc(firebaseAuth.currentUser!.uid).get().then((ds) {
      gender = (ds.data() as dynamic)['gender'];
      name = (ds.data() as dynamic)['name'];
      dob = (ds.data() as dynamic)['dob'];
      birthTime = (ds.data() as dynamic)['birthTime'];
      birthPlace = (ds.data() as dynamic)['birthPlace'];
      lat = (ds.data() as dynamic)['lat'];
      lng = (ds.data() as dynamic)['lng'];
      timezone = (ds.data() as dynamic)['timeZone'];

      }).catchError((e) {
        print(e);
      });
  }
}

//   class UserInfo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
