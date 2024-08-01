import 'point.dart';

class PostResponseModel {
  final String id;
  final PostResultModel result;

  PostResponseModel({required this.id, required this.result});
  Map<String, dynamic> toJson() => {
        "id": id,
        "result": result.toJson(),
      };
}

class PostResultModel {
  final List<PointModel> steps;
  final String path;

  PostResultModel({required this.steps, required this.path});
  Map<String, dynamic> toJson() => {
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "path": path,
      };
}
