import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodayNow extends StatefulWidget {
  const TodayNow({Key? key}) : super(key: key);

  @override
  _TodayNowState createState() => _TodayNowState();
}

class _TodayNowState extends State<TodayNow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child : Column(
          children: <Widget>[
            Card(
              color: Colors.amber,
              margin: EdgeInsets.symmetric(vertical: 1, horizontal: 35),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Panchanga - Now',
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
              elevation: 1,
              child: ListTile(
                leading: Icon(Icons.star_half_outlined),
                title: Text('Tithi'),
                trailing: Icon(Icons.perm_identity),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Yoga'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Karana'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Hora'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Lagna'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Sun Raashi'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Moon Rashi'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Panchaka'),
                trailing: Icon(Icons.food_bank),
              ),
            ),
            Card(
              elevation: 1,
              child: ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Tithi Yoga'),
                trailing: Icon(Icons.food_bank),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
