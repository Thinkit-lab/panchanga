// To parse this JSON data, do
//
//     final panchangModel = panchangModelFromJson(jsonString);

import 'dart:convert';
class PanchangModel {
  PanchangModel({
    required this.Day_Duration,
    required this.Durmuhurtam,
    required this.Gulika_Kalam,
    required this.Karna,
    required this.Maasa,
    required this.MoonRise,
    required this.MoonSet,
    required this.Nakshatra,
    required this.Night_Duration,
    required this.Rahu_Kalam,
    required this.Ritu,
    required this.SunRise,
    required this.SunSet,
    required this.Tithi,
    required this.Vaaram,
    required this.Yama_Kalam,
    required this.Yoga,
  });
  late final String Day_Duration;
  late final String Durmuhurtam;
  late final String Gulika_Kalam;
  late final String Karna;
  late final String Maasa;
  late final String MoonRise;
  late final String MoonSet;
  late final String Nakshatra;
  late final String Night_Duration;
  late final String Rahu_Kalam;
  late final String Ritu;
  late String? SunRise;
  late final String SunSet;
  late final String Tithi;
  late final String Vaaram;
  late final String Yama_Kalam;
  late final String Yoga;

  PanchangModel.fromJson(Map<String, dynamic> json){
    Day_Duration = json['Day Duration'];
    Durmuhurtam = json['Durmuhurtam'];
    Gulika_Kalam = json['Gulika Kalam'];
    Karna = json['Karna'];
    Maasa = json['Maasa'];
    MoonRise = json['MoonRise'];
    MoonSet = json['MoonSet'];
    Nakshatra = json['Nakshatra'];
    Night_Duration = json['Night Duration'];
    Rahu_Kalam = json['Rahu Kalam'];
    Ritu = json['Ritu'];
    SunRise = json['SunRise'];
    SunSet = json['SunSet'];
    Tithi = json['Tithi'];
    Vaaram = json['Vaaram'];
    Yama_Kalam = json['Yama Kalam'];
    Yoga = json['Yoga'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Day Duration'] = Day_Duration;
    _data['Durmuhurtam'] = Durmuhurtam;
    _data['Gulika Kalam'] = Gulika_Kalam;
    _data['Karna'] = Karna;
    _data['Maasa'] = Maasa;
    _data['MoonRise'] = MoonRise;
    _data['MoonSet'] = MoonSet;
    _data['Nakshatra'] = Nakshatra;
    _data['Night Duration'] = Night_Duration;
    _data['Rahu Kalam'] = Rahu_Kalam;
    _data['Ritu'] = Ritu;
    _data['SunRise'] = SunRise;
    _data['SunSet'] = SunSet;
    _data['Tithi'] = Tithi;
    _data['Vaaram'] = Vaaram;
    _data['Yama Kalam'] = Yama_Kalam;
    _data['Yoga'] = Yoga;
    return _data;
  }
}