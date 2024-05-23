class ShiftMasukModel {
  String? id;
  String? userId;
  String? shiftMasuk;

  ShiftMasukModel({
    this.id,
    this.userId,
    this.shiftMasuk,
  });

  factory ShiftMasukModel.fromJson(Map<String, dynamic> json) =>
      ShiftMasukModel(
        id: json["id"],
        userId: json["user_id"],
        shiftMasuk: json["shift_masuk"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "shift_masuk": shiftMasuk,
      };
}

