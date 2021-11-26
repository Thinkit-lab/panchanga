import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panchanga_pandit/networking/panchangcall.dart';

class TodayPanchanga extends StatefulWidget {
  const TodayPanchanga({Key? key}) : super(key: key);

  @override
  _TodayPanchangaState createState() => _TodayPanchangaState();
}

class _TodayPanchangaState extends State<TodayPanchanga> {

  //    late PanchangService panchangService;

  void initState() {
    super.initState();
  //  HoraCalci();
 //   panchangService.getPanchang();
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),),
              color: Colors.amber,
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Panchanga',
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
       //     SizedBox(height: 10,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),),
            color: Colors.indigo,
            elevation: 5,
            child: ListTile(
              //  leading: Icon(Icons.icecream),
              title: Center(
                  child : Text('22/12/2021 - Hyderabad, India')),
                trailing: Icon(Icons.gps_fixed_rounded),
            ),
          ),
         SingleChildScrollView(
    child: Center(
      child: Card(
        elevation: 4,
        color: Colors.brown[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),),
    child : Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child: Column(
              children: <Widget>[
                ListTile(
                  //  leading: Icon(Icons.icecream),
                  title: Text('Vaara'),
                  trailing: Icon(Icons.food_bank),
                ),
                Divider(height: 1,),
                ListTile(
                  //  leading: Icon(Icons.icecream),
                  title: Text('Nakshatra '),
                  trailing: Icon(Icons.food_bank),
                ),
                Divider(height: 1,),
                ListTile(
                  //  leading: Icon(Icons.icecream),
                  title: Text('Tithi '),
                  trailing: Icon(Icons.food_bank),
                ),
                Divider(height: 1,),
                ListTile(
                  //  leading: Icon(Icons.icecream),
                  title: Text('Yoga '),
                  trailing: Icon(Icons.food_bank),
                ),
                Divider(height: 1,),
                ListTile(
                  //  leading: Icon(Icons.icecream),
                  title: Text('Karana '),
                  trailing: Icon(Icons.food_bank),
                ),
                Divider(height: 1,),

              ],
            ),
          ),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            elevation: 5,

            child: Column(
            children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      // align the text to the left instead of centered
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Maasa : ', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      // align the text to the left instead of centered
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Ritu : ', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Ayana : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Paksha : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Sunrise : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Sunset : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Moonrise : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Moonset : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Din Maan : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        // align the text to the left instead of centered
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Raatri Maan : ', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ]
          )),
    ],
    ),),
    ),
    ),
          ],
        ),
      ),
 //     child: Text('Today Panchangam /n Sunrise / Sunset /n Moonrise /n Moonset /n Day Duration /n Vaara, Maasa, Samvat, Saka, Nakshatra, Tithi, Yoga, Karana, Kaala'),
    );
  }
}
