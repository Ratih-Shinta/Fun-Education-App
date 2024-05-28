// To parse this JSON data, do
//
//     final shiftMasukResponse = shiftMasukResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_model.dart';

ShiftMasukResponse shiftMasukResponseFromJson(String str) =>
    ShiftMasukResponse.fromJson(json.decode(str));

String shiftMasukResponseToJson(ShiftMasukResponse data) =>
    json.encode(data.toJson());

class ShiftMasukResponse {
  ShiftMasukModel data;

  ShiftMasukResponse({
    required this.data,
  });

  factory ShiftMasukResponse.fromJson(Map<String, dynamic> json) =>
      ShiftMasukResponse(
        data: ShiftMasukModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

