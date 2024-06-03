class ItemPhotoModel {
    String? id;
    String? albumId;
    String? image;
    String? title;
    String? description;

    ItemPhotoModel({
        this.id,
        this.albumId,
        this.image,
        this.title,
        this.description,
    });

    factory ItemPhotoModel.fromJson(Map<String, dynamic> json) => ItemPhotoModel(
        id: json["id"],
        albumId: json["album_id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "album_id": albumId,
        "image": image,
        "title": title,
        "description": description,
    };
}
