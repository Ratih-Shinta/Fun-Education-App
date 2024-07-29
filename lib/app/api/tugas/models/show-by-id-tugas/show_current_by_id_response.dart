// To parse this JSON data, do
//
//     final showByIdTugasResponse = showByIdTugasResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';

ShowByIdTugasResponse showByIdTugasResponseFromJson(String str) => ShowByIdTugasResponse.fromJson(json.decode(str));

String showByIdTugasResponseToJson(ShowByIdTugasResponse data) => json.encode(data.toJson());

class ShowByIdTugasResponse {
    ShowCurrentTugasModel data;

    ShowByIdTugasResponse({
        required this.data,
    });

    factory ShowByIdTugasResponse.fromJson(Map<String, dynamic> json) => ShowByIdTugasResponse(
        data: ShowCurrentTugasModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}