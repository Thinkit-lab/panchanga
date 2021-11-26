import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panchanga_pandit/screens/customized.dart';
import 'package:panchanga_pandit/screens/panchanga.dart';

import 'choghadhiya.dart';
import 'homescreen.dart';
import 'kaala.dart';
import 'muhurtha.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key, required this.title}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
  final String title;

}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Panchanga(),
 //   HomeScreen(),
    HoraScreen(),
//    Choghadiya(),
    Muhurtha(),
    CustomPancha(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text('Test Drawer'),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white)),
            child: PopupMenuButton<int>(
              color: Colors.black,
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text("Settings")),
                PopupMenuItem<int>(
                    value: 1, child: Text("Profile")),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text("Logout")
                      ],
                    )),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.grey,
        backgroundColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Panchanga',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_vintage),
            label: 'Kaala',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_outlined),
            label: 'Muhurtha',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny_outlined),
            label: 'Personal',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HoraScreen()));
      break;
    case 1:
      print("Privacy Clicked");
      break;
    case 2:
      print("User Logged out");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Muhurtha()),
              (route) => false);
      break;
  }
}

