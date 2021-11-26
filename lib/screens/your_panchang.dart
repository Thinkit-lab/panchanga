import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourPanchang extends StatefulWidget {
  const YourPanchang({Key? key}) : super(key: key);

  @override
  _YourPanchangState createState() => _YourPanchangState();
}

class _YourPanchangState extends State<YourPanchang> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
   //   child: Padding(
   //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
       child: Card(
         color: Colors.teal,
          child: Column(
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),),
                  child: Padding(padding: EdgeInsets.all(16.0),child : ListTile(
                    title: Text(' Tarabal'),
                    subtitle: Text('Janma Tara till and then '),
                  ),)
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),),
                  child: Padding(padding: EdgeInsets.all(16.0),child : ListTile(
                    title: Text(' Chandrabal'),
                    subtitle: Text('Chandra Bal till '),
                  ),)
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),),
                  child: Padding(padding: EdgeInsets.all(16.0),child : ListTile(
                    title: Text(' Pakshi'),
                    subtitle: Text('Chandra Bal till '),
                  ),)
              ),
              SizedBox(height: 5,),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),),
                  child: Padding(padding: EdgeInsets.all(16.0),child : ListTile(
                    title: Text(' Good Time or '),
                    subtitle: Text('Chandra Bal till '),
                  ),)
              ),
              SizedBox(height: 5,),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),),
                  child: Padding(padding: EdgeInsets.all(16.0),child : ListTile(
                    title: Text(' Bad Time for '),
                    subtitle: Text('Chandra Bal till '),
                  ),)
              ),
            ],
          ),
        ),
//      ),
    );
  }
}
