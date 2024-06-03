import 'dart:convert';

import 'package:fun_education_app/app/api/album-photos/models/show_all_album_photo_model.dart';

ShowAllAlbumPhotoResponse showAllAlbumPhotoResponseFromJson(String str) =>
    ShowAllAlbumPhotoResponse.fromJson(json.decode(str));

String showAllAlbumPhotoResponseToJson(ShowAllAlbumPhotoResponse data) =>
    json.encode(data.toJson());

class ShowAllAlbumPhotoResponse {
  List<ShowAllAlbumPhotoModel> data;

  ShowAllAlbumPhotoResponse({
    required this.data,
  });

  factory ShowAllAlbumPhotoResponse.fromJson(Map<String, dynamic> json) =>
      ShowAllAlbumPhotoResponse(
        data: List<ShowAllAlbumPhotoModel>.from(
            json["data"].map((x) => ShowAllAlbumPhotoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
