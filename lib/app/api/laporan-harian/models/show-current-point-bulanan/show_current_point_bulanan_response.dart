// To parse this JSON data, do
//
//     final showCurrentPointBulananResponse = showCurrentPointBulananResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-bulanan/show_current_point_bulanan_model.dart';

ShowCurrentPointBulananResponse showCurrentPointBulananResponseFromJson(String str) => ShowCurrentPointBulananResponse.fromJson(json.decode(str));

String showCurrentPointBulananResponseToJson(ShowCurrentPointBulananResponse data) => json.encode(data.toJson());

class ShowCurrentPointBulananResponse {
    ShowCurrentPointBulananModel data;

    ShowCurrentPointBulananResponse({
        required this.data,
    });

    factory ShowCurrentPointBulananResponse.fromJson(Map<String, dynamic> json) => ShowCurrentPointBulananResponse(
        data: ShowCurrentPointBulananModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}