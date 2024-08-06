class ShowStatisticBottomTitleModel {
    String? date;
    int ?bottomTitleCase;

    ShowStatisticBottomTitleModel({
        this.date,
        this.bottomTitleCase,
    });

    factory ShowStatisticBottomTitleModel.fromJson(Map<String, dynamic> json) => ShowStatisticBottomTitleModel(
        date: json["date"],
        bottomTitleCase: json["case"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "case": bottomTitleCase,
    };
}
