class StatisticReportModel {
    DateTime? date;
    // String ?title;
    int ?totalPoint;
    // int ?spot;

    StatisticReportModel({
        this.date,
        // this.title,
        this.totalPoint,
        // this.spot,
    });

    factory StatisticReportModel.fromJson(Map<String, dynamic> json) => StatisticReportModel(
        date: DateTime.parse(json["date"]),
        // title: json["title"],
        totalPoint: json["total_point"],
        // spot: json["spot"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        // "title": title,
        "total_point": totalPoint,
        // "spot": spot,
    };
}