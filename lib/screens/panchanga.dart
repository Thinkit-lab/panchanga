import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panchanga_pandit/networking/panchangcall.dart';
import 'package:panchanga_pandit/screens/now.dart';
import 'package:panchanga_pandit/screens/today.dart';
import 'package:panchanga_pandit/screens/your_panchang.dart';

import 'advancedpancha.dart';
import 'choghadhiya.dart';
import 'homescreen.dart';
import 'kaala.dart';
import 'muhurtha.dart';

class Panchanga extends StatefulWidget {
  const Panchanga({Key? key}) : super(key: key);

  @override
  _PanchangaState createState() => _PanchangaState();
}

class _PanchangaState extends State<Panchanga> {
  int _selectedIndexForTabBar = 0;

  //late PanchangService panchangService;

  static List<Widget> _listOfIconsForTabBar = <Widget>[
    TodayPanchanga(),
    TodayNow(),
    YourPanchang(),
  ];

  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index;
 //     _selectedIndexForBottomNavigationBar = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    final tabBar = new TabBar(labelColor: Colors.blue[50],
      onTap: _onItemTappedForTabBar,
      tabs: <Widget>[
        new Tab(
          text: "Today",
        ),
        new Tab(
          text: "Now",
        ),
        new Tab(
          text: "Yours",
        ),
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
