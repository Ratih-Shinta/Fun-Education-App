class ShowCurrentTugasImageModel {
    String? id;
    String ?tugasId;
    String ?image;

    ShowCurrentTugasImageModel({
        this.id,
        this.tugasId,
        this.image,
    });

    factory ShowCurrentTugasImageModel.fromJson(Map<String, dynamic> json) => ShowCurrentTugasImageModel(
        id: json["id"],
        tugasId: json["tugas_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tugas_id": tugasId,
        "image": image,
    };
}