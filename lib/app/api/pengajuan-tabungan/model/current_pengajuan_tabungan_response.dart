// To parse this JSON data, do
//
//     final currentPengajuanTabunganiResponse = currentPengajuanTabunganiResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/pengajuan-tabungan/model/current_pengajuan_tabungan_model.dart';

CurrentPengajuanTabunganResponse currentPengajuanTabunganiResponseFromJson(String str) => CurrentPengajuanTabunganResponse.fromJson(json.decode(str));

String currentPengajuanTabunganiResponseToJson(CurrentPengajuanTabunganResponse data) => json.encode(data.toJson());

class CurrentPengajuanTabunganResponse {
    CurrentPengajuanTabunganModel data;

    CurrentPengajuanTabunganResponse({
        required this.data,
    });

    factory CurrentPengajuanTabunganResponse.fromJson(Map<String, dynamic> json) => CurrentPengajuanTabunganResponse(
        data: CurrentPengajuanTabunganModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}