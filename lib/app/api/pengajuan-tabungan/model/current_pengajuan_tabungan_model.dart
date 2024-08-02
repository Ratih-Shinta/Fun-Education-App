class CurrentPengajuanTabunganModel {
    String? id;
    String? userId;
    String? category;
    String? status;

    CurrentPengajuanTabunganModel({
        this.id,
        this.userId,
        this.category,
        this.status,
    });

    factory CurrentPengajuanTabunganModel.fromJson(Map<String, dynamic> json) => CurrentPengajuanTabunganModel(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "status": status,
    };
}
