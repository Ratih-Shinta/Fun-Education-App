import 'package:fun_education_app/app/api/album-photos/models/item_photo_model.dart';

class ShowAllAlbumPhotoModel {
  String? id;
  String? name;
  String? desc;
  List<ItemPhotoModel>? gallery;

  ShowAllAlbumPhotoModel({
    this.id,
    this.name,
    this.desc,
    this.gallery,
  });

  factory ShowAllAlbumPhotoModel.fromJson(Map<String, dynamic> json) =>
      ShowAllAlbumPhotoModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        gallery: List<ItemPhotoModel>.from(
            json["gallery"].map((x) => ItemPhotoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
      };
}
