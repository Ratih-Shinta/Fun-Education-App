import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';

class ShowCurrentTugasModel {
  String? id;
  String? shift;
  String? category;
  String? title;
  String? description;
  String? status;
  String? statusTugasUser;
  int? point;
  DateTime? deadline;
  DateTime? createdAt;
  List<ShowCurrentTugasImageModel>? images;

  ShowCurrentTugasModel({
    this.id,
    this.shift,
    this.category,
    this.title,
    this.description,
    this.status,
    this.statusTugasUser,
    this.point,
    this.deadline,
    this.createdAt,
    this.images,
  });

  factory ShowCurrentTugasModel.fromJson(Map<String, dynamic> json) =>
      ShowCurrentTugasModel(
        id: json["id"],
        shift: json["shift"],
        category: json["category"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        statusTugasUser: json["status_tugas_user"],
        point: json["point"],
        deadline: DateTime.parse(json["deadline"]),
        createdAt: DateTime.parse(json["created_at"]),
        images: List<ShowCurrentTugasImageModel>.from(
            json["images"].map((x) => ShowCurrentTugasImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shift": shift,
        "category": category,
        "title": title,
        "description": description,
        "status": status,
        "status_tugas_user": statusTugasUser,
        "point": point,
        "deadline":
            "${deadline?.year.toString().padLeft(4, '0')}-${deadline?.month.toString().padLeft(2, '0')}-${deadline?.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}
