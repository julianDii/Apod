// To parse this JSON data, do
//
//     final apod = apodFromJson(jsonString);

import 'dart:convert';

Apod apodFromJson(String str) {
  final jsonData = json.decode(str);
  return Apod.fromJson(jsonData);
}

String apodToJson(Apod data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Apod {
  String date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  Apod({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  factory Apod.fromJson(Map<String, dynamic> json) => new Apod(
    date: json["date"],
    explanation: json["explanation"],
    hdurl: json["hdurl"],
    mediaType: json["media_type"],
    serviceVersion: json["service_version"],
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "explanation": explanation,
    "hdurl": hdurl,
    "media_type": mediaType,
    "service_version": serviceVersion,
    "title": title,
    "url": url,
  };
}