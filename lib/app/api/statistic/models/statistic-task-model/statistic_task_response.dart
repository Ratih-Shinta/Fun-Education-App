// To parse this JSON data, do
//
//     final showStatisticCurrentResponse = showStatisticCurrentResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/statistic/models/statistic-task-model/statistic_bottom_tile_model.dart';
import 'package:fun_education_app/app/api/statistic/models/statistic-task-model/statistic_task_model.dart';

StatisticTaskResponse showStatisticCurrentResponseFromJson(String str) => StatisticTaskResponse.fromJson(json.decode(str));

String showStatisticCurrentResponseToJson(StatisticTaskResponse data) => json.encode(data.toJson());

class StatisticTaskResponse {
    // int totalData;
    List<StatisticTaskModel> data;
    List<StatisticBottomTitleModel> bottomTitle;

    StatisticTaskResponse({
        // required this.totalData,
        required this.data,
        required this.bottomTitle,
    });

    factory StatisticTaskResponse.fromJson(Map<String, dynamic> json) => StatisticTaskResponse(
        // totalData: json["total_data"],
        data: List<StatisticTaskModel>.from(json["data"].map((x) => StatisticTaskModel.fromJson(x))),
        bottomTitle: List<StatisticBottomTitleModel>.from(json["bottom_title"].map((x) => StatisticBottomTitleModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        // "total_data": totalData,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "bottom_title": List<dynamic>.from(bottomTitle.map((x) => x.toJson())),
    };
}

