// To parse this JSON data, do
//
//     final showCurrentTugasUserResponse = showCurrentTugasUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/tugas-user/models/show-current-tugas/show_current_tugas_user_model.dart';

ShowCurrentTugasUserResponse showCurrentTugasUserResponseFromJson(String str) => ShowCurrentTugasUserResponse.fromJson(json.decode(str));

String showCurrentTugasUserResponseToJson(ShowCurrentTugasUserResponse data) => json.encode(data.toJson());

class ShowCurrentTugasUserResponse {
    ShowCurrentTugasUserModel data;

    ShowCurrentTugasUserResponse({
        required this.data,
    });

    factory ShowCurrentTugasUserResponse.fromJson(Map<String, dynamic> json) => ShowCurrentTugasUserResponse(
        data: ShowCurrentTugasUserModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

