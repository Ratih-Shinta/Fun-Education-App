// To parse this JSON data, do
//
//     final showStatisticCurrentResponse = showStatisticCurrentResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/tugas-user/models/show-statistic-current/show_statistic_bottom_tile_model.dart';
import 'package:fun_education_app/app/api/tugas-user/models/show-statistic-current/show_statistic_current_model.dart';

ShowStatisticCurrentResponse showStatisticCurrentResponseFromJson(String str) => ShowStatisticCurrentResponse.fromJson(json.decode(str));

String showStatisticCurrentResponseToJson(ShowStatisticCurrentResponse data) => json.encode(data.toJson());

class ShowStatisticCurrentResponse {
    int? totalData;
    List<ShowStatisticCurrentModel> ?data;
    List<ShowStatisticBottomTitleModel>? bottomTitle;

    ShowStatisticCurrentResponse({
        this.totalData,
        this.data,
        this.bottomTitle,
    });

    factory ShowStatisticCurrentResponse.fromJson(Map<String, dynamic> json) => ShowStatisticCurrentResponse(
        totalData: json["total_data"],
        data: List<ShowStatisticCurrentModel>.from(json["data"].map((x) => ShowStatisticCurrentModel.fromJson(x))),
        bottomTitle: List<ShowStatisticBottomTitleModel>.from(json["bottom_title"].map((x) => ShowStatisticBottomTitleModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_data": totalData,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "bottom_title": List<dynamic>.from(bottomTitle!.map((x) => x.toJson())),
    };
}

