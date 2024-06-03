// import 'dart:convert';

// import 'package:fun_education_app/app/api/all-photos/models/show_all_photos_model.dart';

// ShowAllPhotosResponse showAllPhotosResponseFromJson(String str) =>
//     ShowAllPhotosResponse.fromJson(json.decode(str));

// String showAllPhotosResponseToJson(ShowAllPhotosResponse data) =>
//     json.encode(data.toJson());

// class ShowAllPhotosResponse {
//   ShowAllPhotosModel data;

//   ShowAllPhotosResponse({
//     required this.data,
//   });

//   factory ShowAllPhotosResponse.fromJson(Map<String, dynamic> json) =>
//       ShowAllPhotosResponse(
//         data: ShowAllPhotosModel.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

import 'package:fun_education_app/app/api/all-photos/models/show_all_photos_model.dart';

class ShowAllPhotosResponse {
  List<ShowAllPhotosModel> data;

  ShowAllPhotosResponse({
    required this.data,
  });

  factory ShowAllPhotosResponse.fromJson(Map<String, dynamic> json) =>
      ShowAllPhotosResponse(
        data: List<ShowAllPhotosModel>.from(
            json["data"].map((x) => ShowAllPhotosModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
