// To parse this JSON data, do
//
//     final statisticTaskResponse = statisticTaskResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/tugas/models/bottom_titles_task.dart';
import 'package:fun_education_app/app/api/tugas/models/statistic_task_model.dart';

StatisticTaskResponse statisticTaskResponseFromJson(String str) => StatisticTaskResponse.fromJson(json.decode(str));

String statisticTaskResponseToJson(StatisticTaskResponse data) => json.encode(data.toJson());

class StatisticTaskResponse {
    int totalData;
    List<StatisticTaskModel> data;
    List<BottomTitleTask> bottomTitle;

    StatisticTaskResponse({
        required this.totalData,
        required this.data,
        required this.bottomTitle,
    });

    factory StatisticTaskResponse.fromJson(Map<String, dynamic> json) => StatisticTaskResponse(
        totalData: json["total_data"],
        data: List<StatisticTaskModel>.from(json["data"].map((x) => StatisticTaskModel.fromJson(x))),
        bottomTitle: List<BottomTitleTask>.from(json["bottom_title"].map((x) => BottomTitleTask.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_data": totalData,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "bottom_title": List<dynamic>.from(bottomTitle.map((x) => x.toJson())),
    };
}