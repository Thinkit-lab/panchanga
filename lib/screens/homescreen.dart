import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panchanga_pandit/services/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();


  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: Text('Panchanga'
            ),
          ),),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              await authService.signOut(context: context);
            },
            child: Container(
              child: Icon(Icons.logout),
            ),
          )
      ],
    );
  }
}
