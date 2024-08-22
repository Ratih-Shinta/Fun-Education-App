// To parse this JSON data, do
//
//     final showCurrentUserResponse = showCurrentUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';

ShowCurrentUserResponse showCurrentUserResponseFromJson(String str) =>
    ShowCurrentUserResponse.fromJson(json.decode(str));

String showCurrentUserResponseToJson(ShowCurrentUserResponse data) =>
    json.encode(data.toJson());

class ShowCurrentUserResponse {
  ShowCurrentUserModel data;
  String token;

  ShowCurrentUserResponse({
    required this.data,
    required this.token,
  });

  factory ShowCurrentUserResponse.fromJson(Map<String, dynamic> json) =>
      ShowCurrentUserResponse(
        data: ShowCurrentUserModel.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "token": token,
      };
}
