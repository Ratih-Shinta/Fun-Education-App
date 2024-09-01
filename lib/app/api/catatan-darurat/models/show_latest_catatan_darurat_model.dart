import 'package:fun_education_app/app/api/catatan-darurat/models/file_catatan_darurat_model.dart';

class ShowLatestCatatanDaruratModel {
    String? id;
    String? catatan;
    bool? isDeleted;
    List<FileCatatanDaruratModel>? file;

    ShowLatestCatatanDaruratModel({
      this.id,
      this.catatan,
      this.isDeleted,
      this.file,
    });

    factory ShowLatestCatatanDaruratModel.fromJson(Map<String, dynamic> json) => ShowLatestCatatanDaruratModel(
        id: json["id"],
        catatan: json["catatan"],
        isDeleted: json["is_deleted"],
        file: List<FileCatatanDaruratModel>.from(json["file"].map((x) => FileCatatanDaruratModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "catatan": catatan,
        "is_deleted": isDeleted,
        "file": List<dynamic>.from(file!.map((x) => x.toJson())),
    };
}