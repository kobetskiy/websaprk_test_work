import 'dart:convert';

import 'point.dart';

GetResponseModel getResponseFromJson(String str) =>
    GetResponseModel.fromJson(json.decode(str));

String getResponseToJson(GetResponseModel data) => json.encode(data.toJson());

class GetResponseModel {
  GetResponseModel({
    required this.error,
    required this.message,
    required this.data,
  });

  final bool error;
  final String message;
  final List<GetResponseDataModel> data;

  factory GetResponseModel.fromJson(Map<String, dynamic> json) =>
      GetResponseModel(
        error: json["error"],
        message: json["message"],
        data: List<GetResponseDataModel>.from(
          json["data"].map((x) => GetResponseDataModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetResponseDataModel {
  GetResponseDataModel({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  final String id;
  final List<String> field;
  final PointModel start;
  final PointModel end;

  factory GetResponseDataModel.fromJson(Map<String, dynamic> json) {
    return GetResponseDataModel(
      id: json["id"],
      field: List<String>.from(json["field"].map((x) => x)),
      start: PointModel.fromJson(json["start"]),
      end: PointModel.fromJson(json["end"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "field": List<dynamic>.from(field.map((x) => x)),
        "start": start.toJson(),
        "end": end.toJson(),
      };
}
