// To parse this JSON data, do
//
//     final showCurrentAvailableResponse = showCurrentAvailableResponseFromJson(jsonString);

import 'dart:convert';

ShowCurrentAvailableResponse showCurrentAvailableResponseFromJson(String str) => ShowCurrentAvailableResponse.fromJson(json.decode(str));

String showCurrentAvailableResponseToJson(ShowCurrentAvailableResponse data) => json.encode(data.toJson());

class ShowCurrentAvailableResponse {
    List<DateTime> dates;

    ShowCurrentAvailableResponse({
        required this.dates,
    });

    factory ShowCurrentAvailableResponse.fromJson(Map<String, dynamic> json) => ShowCurrentAvailableResponse(
        dates: List<DateTime>.from(json["dates"].map((x) => DateTime.parse(x))),
    );

    Map<String, dynamic> toJson() => {
        "dates": List<dynamic>.from(dates.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
    };
}
