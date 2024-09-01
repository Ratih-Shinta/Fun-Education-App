class FileCatatanDaruratModel {
    String? id;
    String? name;
    String? catatanDaruratId;
    String? file;

    FileCatatanDaruratModel({
       this.id,
       this.name,
       this.catatanDaruratId,
       this.file,
    });

    factory FileCatatanDaruratModel.fromJson(Map<String, dynamic> json) => FileCatatanDaruratModel(
        id: json["id"],
        name: json["name"],
        catatanDaruratId: json["catatan_darurat_id"],
        file: json["file"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "catatan_darurat_id": catatanDaruratId,
        "file": file,
    };
}
