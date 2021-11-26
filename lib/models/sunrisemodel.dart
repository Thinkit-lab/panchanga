class sunrisemodel {
  late Results results;
  late String status;

  sunrisemodel({required this.results, required this.status});

  sunrisemodel.fromJson(Map<String, dynamic> json) {
    results =
    (json['results'] != null ? new Results.fromJson(json['results']) : null)!;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Results {
  late String sunrise;
  late String sunset;
  late String solarNoon;
  late String dayLength;
  late String civilTwilightBegin;
  late String civilTwilightEnd;
  late String nauticalTwilightBegin;
  late String nauticalTwilightEnd;
  late String astronomicalTwilightBegin;
  late String astronomicalTwilightEnd;

  Results(
      {required this.sunrise,
        required this.sunset,
        required this.solarNoon,
        required this.dayLength,
        required this.civilTwilightBegin,
        required this.civilTwilightEnd,
        required this.nauticalTwilightBegin,
        required this.nauticalTwilightEnd,
        required this.astronomicalTwilightBegin,
        required this.astronomicalTwilightEnd});

  Results.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    solarNoon = json['solar_noon'];
    dayLength = json['day_length'];
    civilTwilightBegin = json['civil_twilight_begin'];
    civilTwilightEnd = json['civil_twilight_end'];
    nauticalTwilightBegin = json['nautical_twilight_begin'];
    nauticalTwilightEnd = json['nautical_twilight_end'];
    astronomicalTwilightBegin = json['astronomical_twilight_begin'];
    astronomicalTwilightEnd = json['astronomical_twilight_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['solar_noon'] = this.solarNoon;
    data['day_length'] = this.dayLength;
    data['civil_twilight_begin'] = this.civilTwilightBegin;
    data['civil_twilight_end'] = this.civilTwilightEnd;
    data['nautical_twilight_begin'] = this.nauticalTwilightBegin;
    data['nautical_twilight_end'] = this.nauticalTwilightEnd;
    data['astronomical_twilight_begin'] = this.astronomicalTwilightBegin;
    data['astronomical_twilight_end'] = this.astronomicalTwilightEnd;
    return data;
  }
}
