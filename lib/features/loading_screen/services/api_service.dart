import 'package:webspark_test_work/features/loading_screen/services/breadth_first_search.dart';
import 'package:webspark_test_work/features/models/get_response.dart';
import 'package:webspark_test_work/features/models/point.dart';
import 'package:webspark_test_work/features/models/post_response.dart';
import 'package:webspark_test_work/features/models/static_values.dart';

import 'http_service.dart';

class ApiService {
  final _breadthFirstSearchSearch = BreadthFirstSearch();
  final _httpService = HttpService();

  Future<List<PostResponse>> getResults() async {
    GetResponseModel taskResponse = await getTaskResponse();
    List<PostResponse> results = [];
    for (int i = 0; i < taskResponse.data.length; i++) {
      List<String> road = _breadthFirstSearchSearch.getRoad(
        taskResponse.data[i],
      );
      List<PointModel> steps = [];
      for (int j = 0; j < road.length; j++) {
        List<String> splitedPoint = road[j].split(',');
        PointModel point = PointModel(
          x: int.parse(splitedPoint[1]),
          y: int.parse(splitedPoint[0]),
        );
        steps.add(point);
      }
      String path = '';
      for (int j = 0; j < steps.length - 1; j++) {
        path += '(${steps[j].x},${steps[j].y})->';
      }
      path += '(${steps[steps.length - 1].x},${steps[steps.length - 1].y})';
      PostResponse fullResult = PostResponse(
        id: taskResponse.data[i].id,
        result: PostResult(steps: steps, path: path),
      );
      results.add(fullResult);
    }
    return results;
  }

  Future<int> sendResults() async {
    List<PostResponse> results = Constants.results;
    return await _httpService.postResponse(results);
  }

  Future<GetResponseModel> getTaskResponse() async {
    final response = await _httpService.getResponseBody();
    return GetResponseModel.fromJson(response);
  }
}
