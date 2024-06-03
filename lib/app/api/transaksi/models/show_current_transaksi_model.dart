import 'package:fun_education_app/app/api/transaksi/models/item_transaction_model.dart';

class ShowCurrentTransaksiModel {
    String date;
    List<ItemTransactionModel> transaction;

    ShowCurrentTransaksiModel({
        required this.date,
        required this.transaction,
    });

    factory ShowCurrentTransaksiModel.fromJson(Map<String, dynamic> json) => ShowCurrentTransaksiModel(
        date: json["date"],
        transaction: List<ItemTransactionModel>.from(json["transaction"].map((x) => ItemTransactionModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "transaction": List<dynamic>.from(transaction.map((x) => x.toJson())),
    };
}