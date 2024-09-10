class SchoolInfomationDescriptionModel {
    String id;
    String schoolInformationId;
    String body;

    SchoolInfomationDescriptionModel({
        required this.id,
        required this.schoolInformationId,
        required this.body,
    });

    factory SchoolInfomationDescriptionModel.fromJson(Map<String, dynamic> json) => SchoolInfomationDescriptionModel(
        id: json["id"],
        schoolInformationId: json["school_information_id"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "school_information_id": schoolInformationId,
        "body": body,
    };
}
