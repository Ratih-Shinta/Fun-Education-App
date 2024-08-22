class ShowCurrentUserModel {
    String? id;
    String? fullName;
    String? nickname;
    String? birth;
    String? address;
    String? shift;
    String? gender;
    String? profilePicture;
    String? role;
    dynamic fcmToken;
    bool? isVerified;
    bool? isVerifiedEmail;
    DateTime? createdAt;

    ShowCurrentUserModel({
        this.id,
        this.fullName,
        this.nickname,
        this.birth,
        this.address,
        this.shift,
        this.gender,
        this.profilePicture,
        this.role,
        this.fcmToken,
        this.isVerified,
        this.isVerifiedEmail,
        this.createdAt,
    });

    factory ShowCurrentUserModel.fromJson(Map<String, dynamic> json) => ShowCurrentUserModel(
        id: json["id"],
        fullName: json["full_name"],
        nickname: json["nickname"],
        birth: json["birth"],
        address: json["address"],
        shift: json["shift"],
        gender: json["gender"],
        profilePicture: json["profile_picture"],
        role: json["role"],
        fcmToken: json["fcm_token"],
        isVerified: json["is_verified"],
        isVerifiedEmail: json["is_verified_email"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "nickname": nickname,
        "birth": birth,
        "address": address,
        "shift": shift,
        "gender": gender,
        "profile_picture": profilePicture,
        "role": role,
        "fcm_token": fcmToken,
        "is_verified": isVerified,
        "is_verified_email": isVerifiedEmail,
        "created_at": createdAt?.toIso8601String(),
    };
}