class ShowCurrentMinimumPengajuanModel {
    String? id;
    String? userId;
    String? category;
    String? minimum;
    bool? isEnough;

    ShowCurrentMinimumPengajuanModel({
        this.id,
        this.userId,
        this.category,
        this.minimum,
        this.isEnough,
    });

    factory ShowCurrentMinimumPengajuanModel.fromJson(Map<String, dynamic> json) => ShowCurrentMinimumPengajuanModel(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        minimum: json["minimum"],
        isEnough: json["is_enough"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "minimum": minimum,
        "is_enough": isEnough,
    };
}
