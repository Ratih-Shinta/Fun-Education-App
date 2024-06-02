class ShowCurrentLaporanBulananModel {
    String? id;
    String? userId;
    String? status;
    String? catatan;
    String? halYangPerluDitingkatkan;

    ShowCurrentLaporanBulananModel({
        this.id,
        this.userId,
        this.status,
        this.catatan,
        this.halYangPerluDitingkatkan,
    });

    factory ShowCurrentLaporanBulananModel.fromJson(Map<String, dynamic> json) => ShowCurrentLaporanBulananModel(
        id: json["id"],
        userId: json["user_id"],
        status: json["status"],
        catatan: json["catatan"],
        halYangPerluDitingkatkan: json["hal_yang_perlu_ditingkatkan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status": status,
        "catatan": catatan,
        "hal_yang_perlu_ditingkatkan": halYangPerluDitingkatkan,
    };
}
