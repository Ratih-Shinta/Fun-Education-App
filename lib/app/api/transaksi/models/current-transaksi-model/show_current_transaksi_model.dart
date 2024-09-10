class ShowCurrentTransaksiModel {
    String id;
    String userId;
    String category;
    String amount;
    String? desc;
    DateTime date;

    ShowCurrentTransaksiModel({
        required this.id,
        required this.userId,
        required this.category,
        required this.amount,
        required this.desc,
        required this.date,
    });

    factory ShowCurrentTransaksiModel.fromJson(Map<String, dynamic> json) => ShowCurrentTransaksiModel(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        amount: json["amount"],
        desc: json["desc"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "amount": amount,
        "desc": desc,
        "date": date.toIso8601String(),
    };
}
