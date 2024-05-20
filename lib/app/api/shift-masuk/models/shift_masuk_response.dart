// To parse this JSON data, do
//
//     final shiftMasukResponse = shiftMasukResponseFromJson(jsonString);

import 'dart:convert';

ShiftMasukResponse shiftMasukResponseFromJson(String str) => ShiftMasukResponse.fromJson(json.decode(str));

String shiftMasukResponseToJson(ShiftMasukResponse data) => json.encode(data.toJson());

class ShiftMasukResponse {
    Data data;

    ShiftMasukResponse({
        required this.data,
    });

    factory ShiftMasukResponse.fromJson(Map<String, dynamic> json) => ShiftMasukResponse(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    String? id;
    String? userId;
    String? shiftMasuk;

    Data({
         this.id,
         this.userId,
         this.shiftMasuk,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
