class ShowCurrentTabunganModel {
    String? id;
    String? userId;
    String? saving;
    String? pemasukanTerakhir;
    String? pengeluaranTerakhir;

    ShowCurrentTabunganModel({
        this.id,
        this.userId,
        this.saving,
        this.pemasukanTerakhir,
        this.pengeluaranTerakhir,
    });

    factory ShowCurrentTabunganModel.fromJson(Map<String, dynamic> json) => ShowCurrentTabunganModel(
        id: json["id"],
        userId: json["user_id"],
        saving: json["saving"],
        pemasukanTerakhir: json["pemasukan_terakhir"],
        pengeluaranTerakhir: json["pengeluaran_terakhir"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "saving": saving,
        "pemasukan_terakhir": pemasukanTerakhir,
        "pengeluaran_terakhir": pengeluaranTerakhir,
    };
}