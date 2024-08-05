// To parse this JSON data, do
//
//     final showCurrentLaporanHarianResponse = showCurrentLaporanHarianResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';

ShowCurrentLaporanHarianResponse showCurrentLaporanHarianResponseFromJson(String str) => ShowCurrentLaporanHarianResponse.fromJson(json.decode(str));

String showCurrentLaporanHarianResponseToJson(ShowCurrentLaporanHarianResponse data) => json.encode(data.toJson());

class ShowCurrentLaporanHarianResponse {
    List<ShowCurrentLaporanHarianModel> data;
    dynamic note;
    dynamic totalPoint;

    ShowCurrentLaporanHarianResponse({
        required this.data,
        required this.note,
        required this.totalPoint,
    });

    factory ShowCurrentLaporanHarianResponse.fromJson(Map<String, dynamic> json) => ShowCurrentLaporanHarianResponse(
        data: List<ShowCurrentLaporanHarianModel>.from(json["data"].map((x) => ShowCurrentLaporanHarianModel.fromJson(x))),
        note: json["note"],
        totalPoint: json["total_point"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "note": note,
        "total_point": totalPoint,
    };
}