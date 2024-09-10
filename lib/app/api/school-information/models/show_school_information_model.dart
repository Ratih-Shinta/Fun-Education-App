import 'package:fun_education_app/app/api/school-information/models/school_information_description_model.dart';

class ShowSchoolInfomationModel {
    String id;
    String title;
    List<SchoolInfomationDescriptionModel> description;

    ShowSchoolInfomationModel({
        required this.id,
        required this.title,
        required this.description,
    });

    factory ShowSchoolInfomationModel.fromJson(Map<String, dynamic> json) => ShowSchoolInfomationModel(
        id: json["id"],
        title: json["title"],
        description: List<SchoolInfomationDescriptionModel>.from(json["description"].map((x) => SchoolInfomationDescriptionModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": List<dynamic>.from(description.map((x) => x.toJson())),
    };
}