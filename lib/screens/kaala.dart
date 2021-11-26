import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panchanga_pandit/screens/horadetail.dart';

import 'advancedpancha.dart';
import 'choghadhiya.dart';
import 'hora.dart';

class HoraScreen extends StatefulWidget {
  const HoraScreen({Key? key}) : super(key: key);

  @override
  _HoraScreenState createState() => _HoraScreenState();
}

class _HoraScreenState extends State<HoraScreen> {

  int _selectedIndexForTabBar = 0;

  static List<Widget> _listOfIconsForTabBar = <Widget>[
//    TodayPanchanga(),
//    TodayNow(),
    HoraDetail(),
    Choghadiya(),
    Advanced(),

  ];

  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index;
      //     _selectedIndexForBottomNavigationBar = 0;
    });
  }

  Future<Map> getAllData() async {
//    var api = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400";
//    var api2 = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400";

    var api ="https://panchangam01.herokuapp.com/panchang-api/v1.0/?date=2021-11-11&location=Hyderabad";
    var api2 = "https://panchangam01.herokuapp.com/panchang-api/v1.0/?date=2021-11-12&location=Hyderabad";

    var data = await http.get(Uri.parse(api));
    var data2 = await http.get(Uri.parse(api2));

    var jsonData2 = json.decode(data2.body);
    var jsonData = json.decode(data.body);

    print(jsonData);
    print(jsonData2);

    String sunrise1 = jsonData['SunRise'];//['sunrise'];
    String sunrise2 = jsonData2['SunRise'];//['sunset'];

    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    print(sunrise1);
    return jsonData;
  }

  void initState() {
    super.initState();
    getAllData();
    HoraCal();
  }

  List DayHora = [];
  List HoraCal(){
    print("Inside HoraCal");
    var horaduration = (1637237390 - 1637196830)/12;

    List planets = ["Sun", "Moon", "Mars" ,"Mercury", "Jupiter", "Venus", "Saturn"];
    var srise = 1637196830;
    var sset = 1637237390;


    for (var i = 1; i < 13; i++){
    //  print(i);
      var j = i-1;
      if (i > 6)
      {
        j = i - 7;
      }
 //     print(j);
 //     print("Inside For Loop");
      var hplant = (planets.elementAt(j)).toString();
      //    print(hplant);
      var horaendtime = (srise  + horaduration*(j)).toString();

      var data = hplant +" : "+horaendtime;

 //     print(data);
      DayHora.add(data);
    }
         print(DayHora);
    return DayHora;
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = new TabBar(labelColor: Colors.blue[50],
      onTap: _onItemTappedForTabBar,
      tabs: <Widget>[
        new Tab(
          text: "Hora",
        ),
        new Tab(
          text: "Choghadhiya",
        ),
        new Tab(
          text: "Gowri",
        ),
        /*      new Tab(
          text: "Advanced",
        ),
        new Tab(
          text: "Choghadhiya",
        ), */
      ],
    );
    return DefaultTabController(length: 3, child: new Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(tabBar.preferredSize.height - 50) ,child: tabBar,)
          ,backgroundColor: Colors.black38,),

        //7
        body: Center(
            child:_listOfIconsForTabBar.elementAt(_selectedIndexForTabBar) )
      //    _listOfIconsForBottomNavigationBar.elementAt(_selectedIndexForBottomNavigationBar):
      //    _listOfIconsForTabBar.elementAt(_selectedIndexForTabBar - 1)),),



    ));
  }
}
