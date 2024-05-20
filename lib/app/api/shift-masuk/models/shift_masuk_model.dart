// To parse this JSON data, do
//
//     final shiftMasukModel = shiftMasukModelFromJson(jsonString);

import 'dart:convert';

ShiftMasukModel shiftMasukModelFromJson(String str) =>
    ShiftMasukModel.fromJson(json.decode(str));

String shiftMasukModelToJson(ShiftMasukModel data) =>
    json.encode(data.toJson());

class ShiftMasukModel {
  String? id;
  String? userId;
  String? shiftMasuk;

  ShiftMasukModel({
    this.id,
    this.userId,
    this.shiftMasuk,
  });

  ShiftMasukModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shiftMasuk = json['shift_masuk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shift_masuk'] = this.shiftMasuk;
    return data;
  }
}

