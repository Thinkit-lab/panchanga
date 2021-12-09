import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panchanga_pandit/components/address_search.dart';
import 'package:panchanga_pandit/models/usermodel.dart';
import 'package:panchanga_pandit/screens/homescreen.dart';
import 'package:panchanga_pandit/services/dataBase.dart';
import 'package:panchanga_pandit/services/place_service.dart';
import 'package:uuid/uuid.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_place/google_place.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> gender = ['Male', 'Female'];
  final descriptionController = TextEditingController();

   @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  // form values
  String ? _currentName;
  String ?_currentGender;
  String ?_currentDob;
  String ?_currentbirthTime;
  String ?_currentbirthPlace;
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  TimeOfDay selectedTime = TimeOfDay.now();
  static const kGoogleApiKey = "AIzaSyBuuKWh4NumeNi3JXoOG2YqMHu399rOo9s";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
           padding: EdgeInsets.only(right: 20.0, left: 20.0),
            child: StreamBuilder<UserData>(
              stream: DatabaseService(uid: firebaseAuth.currentUser!.uid).userData,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  UserData? userData = snapshot.data;
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Update your Profile',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20.0),
                              
                            ),
                            initialValue: 'Username', 
                            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                            onChanged: (val) => setState(() => _currentName = val),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20.0),
                              
                            ),
                            value: _currentGender,
                            hint: Text('Gender'),
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                            items: gender.map((gender) {
                              return DropdownMenuItem(
                                value: gender,
                                child: Text('$gender'),
                              );
                            }).toList(),
                            onChanged: (val) => setState(() => _currentGender = val.toString() ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: DateTimePicker(
                        // controller: _date,
                        initialValue: null,
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2050),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Date of Birth',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                        // dateLabelText: 'Date',
                        onChanged: (val) => setState(() => _currentDob = val.toString() ),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => setState(() => _currentDob = val.toString() ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.only(left:10.0),
                                 child: ElevatedButton(
                                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[200]!.withOpacity(0.5),), ),
                                    onPressed: () {
                                    _selectTime(context);
                          },
                        child: Text("Time of Birth "),
                        ),
                               ),
                          Padding(
                            padding: const EdgeInsets.only(right:10.0),
                            child: Text("${selectedTime.hour}:${selectedTime.minute}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          ),
                          ],
                   ),
                      ),
                     SizedBox(
                      height: 20,
                    ),
                    Form(
                // key: UpdateAddress._formKey,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    // cursorColor: UIData.kbrightColor,
                    autofocus: false,
                    controller: descriptionController!,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        // fontFamily: FontFamily.sofiaPro,
                        fontSize: 14),
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.grey[500]!.withOpacity(0.2),
                      filled: true,
                      // focusColor: Colors.accents,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // ),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      hintText: 'Search Location',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(
                              color: Colors.black54,
                              // fontFamily: FontFamily.sofiaPro,
                              fontSize: 14),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    List<AutocompletePrediction> value = [];
                    if (pattern.isNotEmpty) {
                      var googlePlace = GooglePlace(kGoogleApiKey);
                      var result =
                          await googlePlace.queryAutocomplete.get(pattern);
                      return result!.predictions!;
                    }
                    return value;
                  },
                  itemBuilder: (context, AutocompletePrediction value) {
                    return ListTile(
                      leading: Icon(Icons.place),
                      title: Text(value.description!),
                    );
                  },
                  onSuggestionSelected: (AutocompletePrediction suggestion)async {
                    String selectionPlaceId = suggestion.placeId!;
                    // final lat = detail.result.geometry.location.lat;
                    // final lng = detail.result.geometry.location.lng;
                    descriptionController!.text = suggestion.description!;
                    var googlePlace = GooglePlace(kGoogleApiKey);
                 var resul=await   googlePlace.details.get(selectionPlaceId);
                 double lat=resul!.result!.geometry!.location!.lat!;
                 double lng=resul.result!.geometry!.location!.lng!;
                    print(selectionPlaceId);
                  },
                ),
              ),
            //         Container(
            //           decoration: BoxDecoration(
            //             color: Colors.grey[200]!.withOpacity(0.5),
            //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //           ),
            //           child: TextField(
            //   controller: _placecontroller,
            //   readOnly: true,
            //   onTap: () async {
            //     // generate a new token here
            //     final sessionToken = Uuid().v4();
            //     final Suggestion? result = await showSearch(
            //       context: context,
            //       delegate: AddressSearch(),
            //     );
            //     // This will change the text displayed in the TextField
            //     if (result != null) {
            //       setState(() {
            //           _placecontroller.text = result.description;
                      
            //       });
            //     }
            //   },
            //   decoration: InputDecoration(
            //     icon: Container(
            //       width: 10,
            //       height: 10,
            //       child: Icon(
            //           Icons.home,
            //           color: Colors.black,
            //       ),
            //     ),
            //     hintText: "Enter your birth address",
            //     border: InputBorder.none,
            //     contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
            //   ),
            // ),
            //         ),
            SizedBox(height: 10.0),
                        RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              await DatabaseService(uid: firebaseAuth.currentUser!.uid).updateUserData(
                                _currentName!, 
                                _currentGender!, 
                                _currentDob!, 
                                selectedTime.toString(),
                                descriptionController.text,
                                // _currentbirthTime ?? snapshot.data!.birthTime,
                                // _currentbirthPlace ?? snapshot.data.name, 
                              );
                              Get.off(()=>HomeScreen());
                          }
                          }
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }
            ),
          ),
        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial,

      );
      if(timeOfDay != null && timeOfDay != selectedTime)
        {
          setState(() {
            selectedTime = timeOfDay;
          });
        }
  }
}