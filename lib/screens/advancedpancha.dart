import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Advanced extends StatefulWidget {
  const Advanced({Key? key}) : super(key: key);

  @override
  _AdvancedState createState() => _AdvancedState();
}

class _AdvancedState extends State<Advanced> {
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
                title: Text('I like icecream'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('I like icecream'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('I like icecream'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,

              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('I like icecream'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('I like icecream'),
                trailing: Icon(Icons.food_bank),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
