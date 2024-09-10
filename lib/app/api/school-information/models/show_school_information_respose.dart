// To parse this JSON data, do
//
//     final showSchoolInfomationResponse = showSchoolInfomationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/school-information/models/show_school_information_model.dart';

ShowSchoolInfomationResponse showSchoolInfomationResponseFromJson(String str) => ShowSchoolInfomationResponse.fromJson(json.decode(str));

String showSchoolInfomationResponseToJson(ShowSchoolInfomationResponse data) => json.encode(data.toJson());

class ShowSchoolInfomationResponse {
    List<ShowSchoolInfomationModel> data;

    ShowSchoolInfomationResponse({
        required this.data,
    });

    factory ShowSchoolInfomationResponse.fromJson(Map<String, dynamic> json) => ShowSchoolInfomationResponse(
        data: List<ShowSchoolInfomationModel>.from(json["data"].map((x) => ShowSchoolInfomationModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}