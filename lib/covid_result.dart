// To parse this JSON data, do
//
//     final covidToday = covidTodayFromJson(jsonString);

import 'dart:convert';

CovidToday covidTodayFromJson(String str) => CovidToday.fromJson(json.decode(str));

String covidTodayToJson(CovidToday data) => json.encode(data.toJson());

class CovidToday {
  CovidToday({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newConfirmed,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.updateDate,
    this.source,
    this.devBy,
    this.severBy,
  });

  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  String updateDate;
  String source;
  String devBy;
  String severBy;

  factory CovidToday.fromJson(Map<String, dynamic> json) => CovidToday(
    confirmed: json["Confirmed"] == null ? null : json["Confirmed"],
    recovered: json["Recovered"] == null ? null : json["Recovered"],
    hospitalized: json["Hospitalized"] == null ? null : json["Hospitalized"],
    deaths: json["Deaths"] == null ? null : json["Deaths"],
    newConfirmed: json["NewConfirmed"] == null ? null : json["NewConfirmed"],
    newRecovered: json["NewRecovered"] == null ? null : json["NewRecovered"],
    newHospitalized: json["NewHospitalized"] == null ? null : json["NewHospitalized"],
    newDeaths: json["NewDeaths"] == null ? null : json["NewDeaths"],
    updateDate: json["UpdateDate"] == null ? null : json["UpdateDate"],
    source: json["Source"] == null ? null : json["Source"],
    devBy: json["DevBy"] == null ? null : json["DevBy"],
    severBy: json["SeverBy"] == null ? null : json["SeverBy"],
  );

  Map<String, dynamic> toJson() => {
    "Confirmed": confirmed == null ? null : confirmed,
    "Recovered": recovered == null ? null : recovered,
    "Hospitalized": hospitalized == null ? null : hospitalized,
    "Deaths": deaths == null ? null : deaths,
    "NewConfirmed": newConfirmed == null ? null : newConfirmed,
    "NewRecovered": newRecovered == null ? null : newRecovered,
    "NewHospitalized": newHospitalized == null ? null : newHospitalized,
    "NewDeaths": newDeaths == null ? null : newDeaths,
    "UpdateDate": updateDate == null ? null : updateDate,
    "Source": source == null ? null : source,
    "DevBy": devBy == null ? null : devBy,
    "SeverBy": severBy == null ? null : severBy,
  };
}
