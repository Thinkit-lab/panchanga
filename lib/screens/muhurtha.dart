import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../networking/sunrisecall.dart';
import 'advancemuhurtha.dart';
import 'dinanakshatra.dart';

class Muhurtha extends StatefulWidget {
  const Muhurtha({Key? key}) : super(key: key);

  @override
  _MuhurthaState createState() => _MuhurthaState();
}

class _MuhurthaState extends State<Muhurtha> {

  int _selectedIndexForTabBar = 0;

  static List<Widget> _listOfIconsForTabBar = <Widget>[
    AdvanceMuhurtha(),
    DinaNakshatra(),
  ];

  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index;
      //     _selectedIndexForBottomNavigationBar = 0;
    });
  }

  //Map data=await getAllData();

 // print("Sunsrise time is:"+data['status']);

  @override
  Widget build(BuildContext context) {
    final tabBar = new TabBar(labelColor: Colors.blue[50],
      onTap: _onItemTappedForTabBar,
      tabs: <Widget>[
        new Tab(
          text: "Muhurtha",
        ),
        new Tab(
          text: "Advanced",
        ),
  /*      new Tab(
          text: "Advanced",
        ),
        new Tab(
          text: "Choghadhiya",
        ),
    */  ],
    );
    return DefaultTabController(length: 2, child: new Scaffold(
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
