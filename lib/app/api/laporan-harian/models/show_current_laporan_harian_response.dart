// To parse this JSON data, do
//
//     final showCurrentLaporanHarianResponse = showCurrentLaporanHarianResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/laporan-harian/models/show_current_laporan_harian_model.dart';

ShowCurrentLaporanHarianResponse showCurrentLaporanHarianResponseFromJson(String str) => ShowCurrentLaporanHarianResponse.fromJson(json.decode(str));

String showCurrentLaporanHarianResponseToJson(ShowCurrentLaporanHarianResponse data) => json.encode(data.toJson());

class ShowCurrentLaporanHarianResponse {
    ShowCurrentLaporanHarianModel data;

    ShowCurrentLaporanHarianResponse({
        required this.data,
    });

    factory ShowCurrentLaporanHarianResponse.fromJson(Map<String, dynamic> json) => ShowCurrentLaporanHarianResponse(
        data: ShowCurrentLaporanHarianModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

