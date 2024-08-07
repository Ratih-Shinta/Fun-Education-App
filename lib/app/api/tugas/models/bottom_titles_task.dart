class BottomTitleTask {
    String? date;
    int? bottomTitleCase;

    BottomTitleTask({
        this.date,
        this.bottomTitleCase,
    });

    factory BottomTitleTask.fromJson(Map<String, dynamic> json) => BottomTitleTask(
        date: json["date"],
        bottomTitleCase: json["case"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "case": bottomTitleCase,
    };
}