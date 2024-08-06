import 'package:fun_education_app/app/api/tugas-user/models/show-current-tugas/show_current_image_tugas_user_model.dart';

class ShowCurrentTugasUserModel {
  String? id;
  String? tugasId;
  String? fullName;
  String? profilePicture;
  String? status;
  String? note;
  int? grade;
  DateTime? createdAt;
  List<ShowCurrentImageTugasUserModel>? images;

  ShowCurrentTugasUserModel({
    this.id,
    this.tugasId,
    this.fullName,
    this.profilePicture,
    this.status,
    this.note,
    this.grade,
    this.createdAt,
    this.images,
  });

  factory ShowCurrentTugasUserModel.fromJson(Map<String, dynamic> json) =>
      ShowCurrentTugasUserModel(
        id: json["id"],
        tugasId: json["tugas_id"],
        fullName: json["full_name"],
        profilePicture: json["profile_picture"],
        status: json["status"],
        note: json["note"],
        grade: json["grade"],
        createdAt: DateTime.parse(json["created_at"]),
        images: List<ShowCurrentImageTugasUserModel>.from(json["images"]
            .map((x) => ShowCurrentImageTugasUserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tugas_id": tugasId,
        "full_name": fullName,
        "profile_picture": profilePicture,
        "status": status,
        "note": note,
        "grade": grade,
        "created_at": createdAt?.toIso8601String(),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}
