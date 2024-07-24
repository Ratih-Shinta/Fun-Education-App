// To parse this JSON data, do
//
//     final showCurrentPointMingguanResponse = showCurrentPointMingguanResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-mingguan/show_current_point_mingguan_model.dart';

ShowCurrentPointMingguanResponse showCurrentPointMingguanResponseFromJson(String str) => ShowCurrentPointMingguanResponse.fromJson(json.decode(str));

String showCurrentPointMingguanResponseToJson(ShowCurrentPointMingguanResponse data) => json.encode(data.toJson());

class ShowCurrentPointMingguanResponse {
    ShowCurrentPointMingguanModel data;

    ShowCurrentPointMingguanResponse({
        required this.data,
    });

    factory ShowCurrentPointMingguanResponse.fromJson(Map<String, dynamic> json) => ShowCurrentPointMingguanResponse(
        data: ShowCurrentPointMingguanModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}