import 'dart:convert';

import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_model.dart';

ShowCurrentAlurBelajarResponse showCurrentAlurBelajarResponseFromJson(
        String str) =>
    ShowCurrentAlurBelajarResponse.fromJson(json.decode(str));

String showCurrentAlurBelajarResponseToJson(
        ShowCurrentAlurBelajarResponse data) =>
    json.encode(data.toJson());

class ShowCurrentAlurBelajarResponse {
  ShowCurrentAlurBelajarModel data;

  ShowCurrentAlurBelajarResponse({
    required this.data,
  });

  factory ShowCurrentAlurBelajarResponse.fromJson(Map<String, dynamic> json) =>
      ShowCurrentAlurBelajarResponse(
        data: ShowCurrentAlurBelajarModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}
