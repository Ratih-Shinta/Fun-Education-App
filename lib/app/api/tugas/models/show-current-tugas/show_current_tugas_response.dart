// To parse this JSON data, do
//
//     final showCurrentTugasResponse = showCurrentTugasResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';

ShowCurrentTugasResponse showCurrentTugasResponseFromJson(String str) => ShowCurrentTugasResponse.fromJson(json.decode(str));

String showCurrentTugasResponseToJson(ShowCurrentTugasResponse data) => json.encode(data.toJson());

class ShowCurrentTugasResponse {
    List<ShowCurrentTugasModel> data;

    ShowCurrentTugasResponse({
        required this.data,
    });

    factory ShowCurrentTugasResponse.fromJson(Map<String, dynamic> json) => ShowCurrentTugasResponse(
        data: List<ShowCurrentTugasModel>.from(json["data"].map((x) => ShowCurrentTugasModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}