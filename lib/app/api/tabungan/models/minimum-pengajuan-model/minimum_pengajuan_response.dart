// To parse this JSON data, do
//
//     final showCurrentMiniumPengajuanResponse = showCurrentMiniumPengajuanResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/tabungan/models/minimum-pengajuan-model/minimum_pengajuan_model.dart';

ShowCurrentMinimumPengajuanResponse showCurrentMiniumPengajuanResponseFromJson(String str) => ShowCurrentMinimumPengajuanResponse.fromJson(json.decode(str));

String showCurrentMiniumPengajuanResponseToJson(ShowCurrentMinimumPengajuanResponse data) => json.encode(data.toJson());

class ShowCurrentMinimumPengajuanResponse {
    List<ShowCurrentMinimumPengajuanModel> data;

    ShowCurrentMinimumPengajuanResponse({
        required this.data,
    });

    factory ShowCurrentMinimumPengajuanResponse.fromJson(Map<String, dynamic> json) => ShowCurrentMinimumPengajuanResponse(
        data: List<ShowCurrentMinimumPengajuanModel>.from(json["data"].map((x) => ShowCurrentMinimumPengajuanModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}