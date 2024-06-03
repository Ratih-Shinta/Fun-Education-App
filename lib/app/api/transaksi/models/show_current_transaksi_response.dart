// To parse this JSON data, do
//
//     final showCurrentTransaksiResponse = showCurrentTransaksiResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_model.dart';

ShowCurrentTransaksiResponse showCurrentTransaksiResponseFromJson(String str) => ShowCurrentTransaksiResponse.fromJson(json.decode(str));

String showCurrentTransaksiResponseToJson(ShowCurrentTransaksiResponse data) => json.encode(data.toJson());

class ShowCurrentTransaksiResponse {
    List<ShowCurrentTransaksiModel> data;

    ShowCurrentTransaksiResponse({
        required this.data,
    });

    factory ShowCurrentTransaksiResponse.fromJson(Map<String, dynamic> json) => ShowCurrentTransaksiResponse(
        data: List<ShowCurrentTransaksiModel>.from(json["data"].map((x) => ShowCurrentTransaksiModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

