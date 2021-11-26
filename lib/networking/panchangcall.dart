import 'dart:convert';

//import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:panchanga_pandit/models/panchangmodel.dart';

class PanchangService {

  Future<List<PanchangModel>> getPanchang() async {
    print('Panchang Model GetPanchang Called');

    String finalDate;
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";

    // setState(() {
    finalDate = formattedDate.toString();

    final endpointUrl = 'https://panchangam01.herokuapp.com/panchang-api/v1.0/?date=$finalDate&location=Hyderabad';
    print (endpointUrl);
    final response = await http.get(Uri.parse(endpointUrl));


    if (response.statusCode == 200) {
      //    final jsonResponse = json.decode(response.body);

      List _urls = json.decode(response.body);

      var _res = _urls.map((_urls) => PanchangModel.fromJson(_urls)).toList();
      return _res;

/*

      String rb = response.body;

      // store json data into list
      var list = json.decode(rb) as List;

      // iterate over the list and map each object in list to Img by calling Img.fromJson
      List<PanchangModel> panchangModel = list.map((i)=>PanchangModel.fromJson(i)).toList();

      print(panchangModel.runtimeType); //returns List<Img>
      print(panchangModel[0].runtimeType); //returns Img

      print('*****************************************************************');
      print('panchangModel');

      return panchangModel;





     // print (panchangModel);
*/

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load panchang');
    }
  }

  Future<PanchangModel> getPanchanga() async {

    String finalDate;
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";

    // setState(() {
    finalDate = formattedDate.toString();

    final response =
    await http.get(Uri.parse('https://panchangam01.herokuapp.com/panchang-api/v1.0/?date=$finalDate&location=Hyderabad'));


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      //  mapResponse = json.decode(response.body);
      //  listOfFacts = mapResponse['Nakshatra'];

      //   String data = response.body;
      // data = jsonDecode(response.body);
      //List<dynamic> values=new List<dynamic>();
      //values = json.decode(response.body);
      // print(data);

      return PanchangModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}