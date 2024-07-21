class ShowCurrentPointBulananModel {
    int? week1Point;
    int? week2Point;
    int? week3Point;
    int? week4Point;

    ShowCurrentPointBulananModel({
        this.week1Point,
        this.week2Point,
        this.week3Point,
        this.week4Point,
    });

    factory ShowCurrentPointBulananModel.fromJson(Map<String, dynamic> json) => ShowCurrentPointBulananModel(
        week1Point: json["week1_point"],
        week2Point: json["week2_point"],
        week3Point: json["week3_point"],
        week4Point: json["week4_point"],
    );

    Map<String, dynamic> toJson() => {
        "week1_point": week1Point,
        "week2_point": week2Point,
        "week3_point": week3Point,
        "week4_point": week4Point,
    };
}
