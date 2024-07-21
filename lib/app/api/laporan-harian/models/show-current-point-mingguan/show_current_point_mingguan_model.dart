class ShowCurrentPointMingguanModel {
    int? mondayPoint;
    int? tuesdayPoint;
    int? wednesdayPoint;
    int? thursdayPoint;
    int? fridayPoint;
    int? saturdayPoint;
    int? sundayPoint;

    ShowCurrentPointMingguanModel({
        this.mondayPoint,
        this.tuesdayPoint,
        this.wednesdayPoint,
        this.thursdayPoint,
        this.fridayPoint,
        this.saturdayPoint,
        this.sundayPoint,
    });

    factory ShowCurrentPointMingguanModel.fromJson(Map<String, dynamic> json) => ShowCurrentPointMingguanModel(
        mondayPoint: json["monday_point"],
        tuesdayPoint: json["tuesday_point"],
        wednesdayPoint: json["wednesday_point"],
        thursdayPoint: json["thursday_point"],
        fridayPoint: json["friday_point"],
        saturdayPoint: json["saturday_point"],
        sundayPoint: json["sunday_point"],
    );

    Map<String, dynamic> toJson() => {
        "monday_point": mondayPoint,
        "tuesday_point": tuesdayPoint,
        "wednesday_point": wednesdayPoint,
        "thursday_point": thursdayPoint,
        "friday_point": fridayPoint,
        "saturday_point": saturdayPoint,
        "sunday_point": sundayPoint,
    };
}
