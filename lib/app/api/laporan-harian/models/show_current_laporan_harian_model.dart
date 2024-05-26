class ShowCurrentLaporanHarianModel {
    String? id;
    String? userId;
    String? datangTepatPadaWaktunya;
    String? berpakaianRapi;
    String? berbuatBaikDenganTeman;
    String? mauMenolongDanBerbagiDenganTeman;
    String? merapikanAlatBelajarDanMainanSendiri;
    String? menyelesaikanTugas;
    String? membaca;
    String? menulis;
    String? dikte;
    String? keterampilan;

    ShowCurrentLaporanHarianModel({
        this.id,
        this.userId,
        this.datangTepatPadaWaktunya,
        this.berpakaianRapi,
        this.berbuatBaikDenganTeman,
        this.mauMenolongDanBerbagiDenganTeman,
        this.merapikanAlatBelajarDanMainanSendiri,
        this.menyelesaikanTugas,
        this.membaca,
        this.menulis,
        this.dikte,
        this.keterampilan,
    });

    factory ShowCurrentLaporanHarianModel.fromJson(Map<String, dynamic> json) => ShowCurrentLaporanHarianModel(
        id: json["id"],
        userId: json["user_id"],
        datangTepatPadaWaktunya: json["datang_tepat_pada_waktunya"],
        berpakaianRapi: json["berpakaian_rapi"],
        berbuatBaikDenganTeman: json["berbuat_baik_dengan_teman"],
        mauMenolongDanBerbagiDenganTeman: json["mau_menolong_dan_berbagi_dengan_teman"],
        merapikanAlatBelajarDanMainanSendiri: json["merapikan_alat_belajar_dan_mainan_sendiri"],
        menyelesaikanTugas: json["menyelesaikan_tugas"],
        membaca: json["membaca"],
        menulis: json["menulis"],
        dikte: json["dikte"],
        keterampilan: json["keterampilan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "datang_tepat_pada_waktunya": datangTepatPadaWaktunya,
        "berpakaian_rapi": berpakaianRapi,
        "berbuat_baik_dengan_teman": berbuatBaikDenganTeman,
        "mau_menolong_dan_berbagi_dengan_teman": mauMenolongDanBerbagiDenganTeman,
        "merapikan_alat_belajar_dan_mainan_sendiri": merapikanAlatBelajarDanMainanSendiri,
        "menyelesaikan_tugas": menyelesaikanTugas,
        "membaca": membaca,
        "menulis": menulis,
        "dikte": dikte,
        "keterampilan": keterampilan,
    };
}
