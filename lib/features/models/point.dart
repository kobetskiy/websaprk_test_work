class PointModel {
  PointModel({required this.x, required this.y});

  final int x;
  final int y;

  factory PointModel.fromJson(Map<String, dynamic> json) {
    return PointModel(x: json["x"], y: json["y"]);
  }

  Map<String, dynamic> toJson() => {"x": x, "y": y};
}
