import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:space/Apod.dart';

const baseUrl = "https://api.nasa.gov/planetary/apod?";
const api_key = "soGAktRK7d7ErYh3d9JNWiNKXOkfC3CHg6lMzr0u";

Future<Apod> getApod(String date) async {
  String sanitizedDate = sanitizeDateString(date);
  String url =
      baseUrl + "api_key=" + api_key + "&date=" + sanitizedDate + "&hd=True";
  print(url);

  final response = await http.get(url, headers: {"Accept": "applicarion/json"});

  if (response.statusCode == 200) {
    return Apod.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch Apod!');
  }
}

sanitizeDateString(date) {
  var parts = date.split("T");
  return parts[0];
}
