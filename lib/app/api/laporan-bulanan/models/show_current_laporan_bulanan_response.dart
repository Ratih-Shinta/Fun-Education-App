import 'dart:convert';

import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_model.dart';

ShowCurrentLaporanBulananResponse showCurrentLaporanBulananResponseFromJson(String str) => ShowCurrentLaporanBulananResponse.fromJson(json.decode(str));

String showCurrentLaporanBulananResponseToJson(ShowCurrentLaporanBulananResponse data) => json.encode(data.toJson());

class ShowCurrentLaporanBulananResponse {
    ShowCurrentLaporanBulananModel data;

    ShowCurrentLaporanBulananResponse({
        required this.data,
    });

    factory ShowCurrentLaporanBulananResponse.fromJson(Map<String, dynamic> json) => ShowCurrentLaporanBulananResponse(
        data: ShowCurrentLaporanBulananModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}