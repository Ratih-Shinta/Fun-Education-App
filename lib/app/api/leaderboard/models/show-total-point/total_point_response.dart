// To parse this JSON data, do
//
//     final showTotalPointResponse = showTotalPointResponseFromJson(jsonString);

import 'dart:convert';

ShowTotalPointResponse showTotalPointResponseFromJson(String str) => ShowTotalPointResponse.fromJson(json.decode(str));

String showTotalPointResponseToJson(ShowTotalPointResponse data) => json.encode(data.toJson());

class ShowTotalPointResponse {
    String point;

    ShowTotalPointResponse({
        required this.point,
    });

    factory ShowTotalPointResponse.fromJson(Map<String, dynamic> json) => ShowTotalPointResponse(
        point: json["point"],
    );

    Map<String, dynamic> toJson() => {
        "point": point,
    };
}
