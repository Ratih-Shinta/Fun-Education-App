class ItemTransactionModel {
    String? id;
    String? userId;
    String? amount;
    String? category;
    String? desc;
    String? date;

    ItemTransactionModel({
        this.id,
        this.userId,
        this.amount,
        this.category,
        this.desc,
        this.date,
    });

    factory ItemTransactionModel.fromJson(Map<String, dynamic> json) => ItemTransactionModel(
        id: json["id"],
        userId: json["user_id"],
        amount: json["amount"],
        category: json["category"],
        desc: json["desc"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "amount": amount,
        "category": category,
        "desc": desc,
        "date": date,
    };
}
