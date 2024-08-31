// To parse this JSON data, do
//
//     final showStatisticCurrentResponse = showStatisticCurrentResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app/app/api/statistic/models/statistic-report-model/statistic_report_model.dart';
import 'package:fun_education_app/app/api/statistic/models/statistic-task-model/statistic_bottom_tile_model.dart';
import 'package:fun_education_app/app/api/statistic/models/statistic-task-model/statistic_task_model.dart';

StatisticReportResponse showStatisticCurrentResponseFromJson(String str) => StatisticReportResponse.fromJson(json.decode(str));

String showStatisticCurrentResponseToJson(StatisticReportResponse data) => json.encode(data.toJson());

class StatisticReportResponse {
    // int totalData;
    List<StatisticReportModel> data;
    List<StatisticBottomTitleModel> bottomTitle;

    StatisticReportResponse({
        // required this.totalData,
        required this.data,
        required this.bottomTitle,
    });

    factory StatisticReportResponse.fromJson(Map<String, dynamic> json) => StatisticReportResponse(
        // totalData: json["total_data"],
        data: List<StatisticReportModel>.from(json["data"].map((x) => StatisticReportModel.fromJson(x))),
        bottomTitle: List<StatisticBottomTitleModel>.from(json["bottom_title"].map((x) => StatisticBottomTitleModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        // "total_data": totalData,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "bottom_title": List<dynamic>.from(bottomTitle.map((x) => x.toJson())),
    };
}

