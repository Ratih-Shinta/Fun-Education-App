class ShowCurrentLaporanHarianModel {
    String? id;
    String? activity;
    String? grade;

    ShowCurrentLaporanHarianModel({
        this.id,
        this.activity,
        this.grade,
    });

    factory ShowCurrentLaporanHarianModel.fromJson(Map<String, dynamic> json) => ShowCurrentLaporanHarianModel(
        id: json["id"],
        activity: json["activity"],
        grade: json["grade"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "activity": activity,
        "grade": grade,
    };
}
