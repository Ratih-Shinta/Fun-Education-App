// To parse this JSON data, do
//
//     final showLatestCatatanDaruratResponse = showLatestCatatanDaruratResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/catatan-darurat/models/show_latest_catatan_darurat_model.dart';

ShowLatestCatatanDaruratResponse showLatestCatatanDaruratResponseFromJson(String str) => ShowLatestCatatanDaruratResponse.fromJson(json.decode(str));

String showLatestCatatanDaruratResponseToJson(ShowLatestCatatanDaruratResponse data) => json.encode(data.toJson());

class ShowLatestCatatanDaruratResponse {
    ShowLatestCatatanDaruratModel data;

    ShowLatestCatatanDaruratResponse({
        required this.data,
    });

    factory ShowLatestCatatanDaruratResponse.fromJson(Map<String, dynamic> json) => ShowLatestCatatanDaruratResponse(
        data: ShowLatestCatatanDaruratModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

