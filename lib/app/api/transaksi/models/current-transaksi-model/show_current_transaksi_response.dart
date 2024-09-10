// To parse this JSON data, do
//
//     final showCurrentTransaksiResponse = showCurrentTransaksiResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/transaksi/models/current-transaksi-model/show_current_transaksi_model.dart';

ShowCurrentTransaksiResponse showCurrentTransaksiResponseFromJson(String str) => ShowCurrentTransaksiResponse.fromJson(json.decode(str));

String showCurrentTransaksiResponseToJson(ShowCurrentTransaksiResponse data) => json.encode(data.toJson());

class ShowCurrentTransaksiResponse {
    String totalIncome;
    String totalOutcome;
    List<ShowCurrentTransaksiModel> data;

    ShowCurrentTransaksiResponse({
        required this.totalIncome,
        required this.totalOutcome,
        required this.data,
    });

    factory ShowCurrentTransaksiResponse.fromJson(Map<String, dynamic> json) => ShowCurrentTransaksiResponse(
        totalIncome: json["total_income"],
        totalOutcome: json["total_outcome"],
        data: List<ShowCurrentTransaksiModel>.from(json["data"].map((x) => ShowCurrentTransaksiModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_income": totalIncome,
        "total_outcome": totalOutcome,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}