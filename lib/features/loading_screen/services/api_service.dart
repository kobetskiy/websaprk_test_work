import 'package:webspark_test_work/features/loading_screen/services/breadth_first_search.dart';
import 'package:webspark_test_work/features/models/constants.dart';
import 'package:webspark_test_work/features/models/get_response.dart';
import 'package:webspark_test_work/features/models/point.dart';
import 'package:webspark_test_work/features/models/post_response.dart';

import 'http_service.dart';

class ApiService {
  final BreadthFirstSearch _breadthFirstSearch = BreadthFirstSearch();
  final HttpService _httpService = HttpService();

  Future<List<PostResponseModel>> getResult() async {
    final taskResponse = await getResponseModel();
    return _processTasks(taskResponse.data);
  }

  Future<int> sendResult() async {
    final results = Constants.resultList;
    return await _httpService.postResponse(results);
  }

  Future<GetResponseModel> getResponseModel() async {
    final response = await _httpService.getResponse();
    return GetResponseModel.fromJson(response);
  }

  List<PostResponseModel> _processTasks(List<GetResponseDataModel> tasks) {
    return tasks.map((task) {
      final road = _breadthFirstSearch.getRoad(task);
      final steps = _convertRoadToSteps(road);
      final path = _buildPathString(steps);

      return PostResponseModel(
        id: task.id,
        result: PostResultModel(steps: steps, path: path),
      );
    }).toList();
  }

  List<PointModel> _convertRoadToSteps(List<String> road) {
    return road.map((point) {
      final coordinates = point.split(',');
      return PointModel(
        x: int.parse(coordinates[1]),
        y: int.parse(coordinates[0]),
      );
    }).toList();
  }

  String _buildPathString(List<PointModel> steps) {
    final path = steps.map((step) => '(${step.x},${step.y})').join('->');
    return path;
  }
}