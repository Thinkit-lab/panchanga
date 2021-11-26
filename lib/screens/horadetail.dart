import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panchanga_pandit/models/panchangmodel.dart';
import 'package:panchanga_pandit/models/sunrisemodel.dart';
import 'package:panchanga_pandit/networking/panchangcall.dart';
import 'package:panchanga_pandit/networking/sunrisecall.dart';

/* This page calculates Hora.
Inputs : Today's sunrise, sunset and tomorrow's sunrise.

Calculation : Each day is ruled by a planet.

 */

class HoraDetail extends StatefulWidget {
  const HoraDetail({Key? key}) : super(key: key);

  @override
  _HoraDetailState createState() => _HoraDetailState();
}

class _HoraDetailState extends State<HoraDetail> {

  late Future<Map> future;
  late PanchangService panchangService;

  void initState() {
    super.initState();
//    _getAllData();
      HoraCalci();
  }

  var srise = 1637196830;
  var sset = 1637237390;

  var dayduration = (1637237390 - 1637196830);

  var horaduration = (1637237390 - 1637196830)/12;

  List planets = ["Sun", "Moon", "Mercury", "Jupiter", "Venus", "Saturn"];

  List DayHora=[];


  List HoraCalci(){
    List DayHora = [];
    //print("Inside HoraCal");
    var horaduration = (1637237390 - 1637196830)/12;

    List planets = ["Sun", "Moon", "Mars" ,"Mercury", "Jupiter", "Venus", "Saturn"];
    var srise = 1637196830;
    var sset = 1637237390;


    for (var i = 1; i < 13; i++){
      //  print(i);
      // var len = planets.length - 1;
      var j = i-1;
      if (i > 7)
      {
        j = i - 8;
      }
      //   print(j);
      //   print("Inside For Loop");
      var hplant = (planets.elementAt(j)).toString();
      //    print(hplant);
      var horaendtime = (srise  + horaduration*(i)).toInt();

      var datetime = DateTime.fromMillisecondsSinceEpoch(horaendtime*1000);

      var data = hplant +" : "+datetime.toString();

      //   print(data);
      DayHora.add(data);
    }
    print(DayHora);
    return DayHora;
  }

    //








  _getAllData() async {
    await panchangService.getPanchanga().then((values){
      future = values as Future<Map>;
      setState(() {});
    }).catchError((err){

    });
  }

  //s1 = sunrisemodel.fromJson()

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child : Column(
          children: <Widget>[
            Card(
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                      'Day Hora',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Time No '+DateTime.now().millisecondsSinceEpoch.toString()),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Moon '+DayHora.toString()),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Mercury'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,

              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Mars'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Venus'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Jupiter'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Saturn'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              color: Colors.amber,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Night Hora',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Sun'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Moon'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Mercury'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,

              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Mars'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Venus'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Jupiter'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Saturn'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


