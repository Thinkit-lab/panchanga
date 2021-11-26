import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvanceMuhurtha extends StatefulWidget {
  const AdvanceMuhurtha({Key? key}) : super(key: key);

  @override
  _AdvanceMuhurthaState createState() => _AdvanceMuhurthaState();
}

class _AdvanceMuhurthaState extends State<AdvanceMuhurtha> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child : Column(
          children: <Widget>[
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
                      'Muhurthas',
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
                title: Text('Brahma Muhurtha'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Vijaya Muhurtha'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Abhijitha Muhurtha'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,

              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Godhuli Muhurtha'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Nishitha Muhurtha'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Rahu Kaala'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Gulika Kaala'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,

              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Yama Ganda'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Nishitha Muhurtha'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Dur Muhurtham'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Varjyam'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Gandanta'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
