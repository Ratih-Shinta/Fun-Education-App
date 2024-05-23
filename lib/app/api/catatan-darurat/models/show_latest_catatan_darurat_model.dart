class ShowLatestCatatanDaruratModel {
    String? id;
    String? catatan;
    bool? isDeleted;

    ShowLatestCatatanDaruratModel({
        this.id,
        this.catatan,
        this.isDeleted,
    });

    factory ShowLatestCatatanDaruratModel.fromJson(Map<String, dynamic> json) => ShowLatestCatatanDaruratModel(
        id: json["id"],
        catatan: json["catatan"],
        isDeleted: json["is_deleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "catatan": catatan,
        "is_deleted": isDeleted,
    };
}
