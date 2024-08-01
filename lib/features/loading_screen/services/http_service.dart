import 'dart:convert';

import 'package:http/http.dart';
import 'package:webspark_test_work/features/models/constants.dart';
import 'package:webspark_test_work/features/models/post_response.dart';

class HttpService {
  Future<Map<String, dynamic>> getResponse() async {
    Response response = await get(Uri.parse(Constants.apiUrl));
    return jsonDecode(response.body);
  }

  Future<int> postResponse(List<PostResponseModel> results) async {
    Response response = await post(
      Uri.parse(Constants.apiUrl),
      headers: {"Content-type": "application/json"},
      body: json.encode(List<dynamic>.from(results.map((x) => x.toJson()))),
    );

    return response.statusCode;
  }
}
