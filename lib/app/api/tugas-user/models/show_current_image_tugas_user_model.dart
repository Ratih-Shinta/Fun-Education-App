class ShowCurrentImageTugasUserModel {
    String? id;
    String? tugasUserId;
    String? image;

    ShowCurrentImageTugasUserModel({
        this.id,
        this.tugasUserId,
        this.image,
    });

    factory ShowCurrentImageTugasUserModel.fromJson(Map<String, dynamic> json) => ShowCurrentImageTugasUserModel(
        id: json["id"],
        tugasUserId: json["tugas_user_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tugas_user_id": tugasUserId,
        "image": image,
    };
}
