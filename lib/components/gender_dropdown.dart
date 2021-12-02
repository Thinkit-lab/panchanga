import 'package:flutter/material.dart';

class Item {
  const Item(this.name);
  final String name;

}
class Type extends StatefulWidget {
  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {
  late Item selectedUser;
  List<Item> users = <Item>[
    const Item('Male'),
    const Item('Female'),
    
  ];
  @override
  Widget build(BuildContext context) {
    return  DropdownButton<Item>(
      hint:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text("Gender"),
      ),
      value: selectedUser,
      onChanged: (Item ) {
        setState(() {
          selectedUser = Item!;
        });
      },
      items: users.map((Item user) {
        return  DropdownMenuItem<Item>(
          value: user,
          child: Row(
            children: <Widget>[
              // user.icon,
              // SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  user.name,
                  style:  TextStyle(color: Colors.black, fontFamily: 'Lato'),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
