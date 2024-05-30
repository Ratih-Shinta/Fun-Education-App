// To parse this JSON data, do
//
//     final showCurrentTabunganResponse = showCurrentTabunganResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';

ShowCurrentTabunganResponse showCurrentTabunganResponseFromJson(String str) => ShowCurrentTabunganResponse.fromJson(json.decode(str));

String showCurrentTabunganResponseToJson(ShowCurrentTabunganResponse data) => json.encode(data.toJson());

class ShowCurrentTabunganResponse {
    ShowCurrentTabunganModel data;

    ShowCurrentTabunganResponse({
        required this.data,
    });

    factory ShowCurrentTabunganResponse.fromJson(Map<String, dynamic> json) => ShowCurrentTabunganResponse(
        data: ShowCurrentTabunganModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}


