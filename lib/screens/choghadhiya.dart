import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choghadiya extends StatefulWidget {
  const Choghadiya({Key? key}) : super(key: key);

  @override
  _ChoghadiyaState createState() => _ChoghadiyaState();
}

class _ChoghadiyaState extends State<Choghadiya> {
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
                  'Day Choghadhiya',
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
                title: Text('Rog'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Udveg'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Shubh'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,

              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Labh'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Kal'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Amrith'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Chara'),
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
                      'Night Choghadhiya',
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
                title: Text('Amrith'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Kala'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Shubha'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,

              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Labh'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Roga'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Udvega'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Chara'),
                trailing: Icon(Icons.account_box_outlined),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
