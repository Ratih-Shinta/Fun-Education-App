class ShowCurrentUserModel {
    String? id;
    String? username;
    String? tempatTanggalLahir;
    String? alamat;
    String? profilePicture;
    String? role;

    ShowCurrentUserModel({
        this.id,
        this.username,
        this.tempatTanggalLahir,
        this.alamat,
        this.profilePicture,
        this.role,
    });

    factory ShowCurrentUserModel.fromJson(Map<String, dynamic> json) => ShowCurrentUserModel(
        id: json["id"],
        username: json["username"],
        tempatTanggalLahir: json["tempat_tanggal_lahir"],
        alamat: json["alamat"],
        profilePicture: json["profile_picture"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "tempat_tanggal_lahir": tempatTanggalLahir,
        "alamat": alamat,
        "profile_picture": profilePicture,
        "role": role,
    };
}
