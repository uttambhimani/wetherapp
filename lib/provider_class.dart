import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wetherapp/WetherModel.dart';

class HomeProvider extends ChangeNotifier
{

  String lon = "72.8333";  String lan = "21.1667";

  void changeWeather(String wlan,String wlon)
  {
    lan = wlan;
    lon = wlon;
    notifyListeners();

  }
  Future<WetherModel> weatherapi(String clan,String clon)
  async{
    String apilink = "https://api.openweathermap.org/data/2.5/weather?lat=$clan&lon=$clon&appid=9628b95a2235abb2f18055013ade5de8";
    var jsonString = await http.get(Uri.parse(apilink));

    var json = jsonDecode(jsonString.body);

    print(clan);
    print(clon);

    return WetherModel.fromJson(json);

  }
}