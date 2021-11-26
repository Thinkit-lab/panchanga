
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SunriseCall {

  Future<Map> getAllData() async {
    var api = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400";

    var data = await http.get(Uri.parse(api));

    var jsonData = json.decode(data.body);

    print(jsonData);
    return jsonData;
  }

}