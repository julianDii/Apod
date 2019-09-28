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

  factory Apod.fromJson(Map<String, dynamic> json) =>
      new Apod(
        date: json["date"] == null ? null : json["date"],
        explanation: json["explanation"] == null ? null : json["explanation"],
        hdurl: json["hdurl"] == null ? null : json["hdurl"],
        mediaType: json["media_type"] == null ? null : json["media_type"],
        serviceVersion: json["service_version"] == null
            ? null
            : json["service_version"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() =>
      {
        "date": date == null ? null : date,
        "explanation": explanation == null ? null : explanation,
        "hdurl": hdurl == null ? null : hdurl,
        "media_type": mediaType == null ? null : mediaType,
        "service_version": serviceVersion == null ? null : serviceVersion,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
      };
}