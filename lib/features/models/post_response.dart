import 'point.dart';

class PostResponse {
  final String id;
  final PostResult result;

  PostResponse({required this.id, required this.result});
  Map<String, dynamic> toJson() => {
        "id": id,
        "result": result.toJson(),
      };
}

class PostResult {
  final List<PointModel> steps;
  final String path;

  PostResult({required this.steps, required this.path});
  Map<String, dynamic> toJson() => {
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "path": path,
      };
}
