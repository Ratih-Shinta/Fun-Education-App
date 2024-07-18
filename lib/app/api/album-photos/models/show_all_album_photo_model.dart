import 'package:fun_education_app/app/api/album-photos/models/item_photo_model.dart';

class ShowAllAlbumPhotoModel {
  String? id;
  String? name;
  String? desc;
  String ?cover;
  DateTime? createdAt;
  int? galleryCount;
  List<ItemPhotoModel>? gallery;

  ShowAllAlbumPhotoModel({
    this.id,
    this.name,
    this.desc,
    this.cover,
    this.createdAt,
    this.galleryCount,
    this.gallery,
  });

  factory ShowAllAlbumPhotoModel.fromJson(Map<String, dynamic> json) => ShowAllAlbumPhotoModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        cover: json["cover"],
        createdAt: DateTime.parse(json["created_at"]),
        galleryCount: json["gallery_count"],
        gallery:
            List<ItemPhotoModel>.from(json["gallery"].map((x) => ItemPhotoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "cover": cover,
        "created_at": createdAt?.toIso8601String(),
        "gallery_count": galleryCount,
        "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
      };
}
