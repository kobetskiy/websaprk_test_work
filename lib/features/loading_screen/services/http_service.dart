import 'dart:convert';

import 'package:http/http.dart';
import 'package:webspark_test_work/features/models/post_response.dart';
import 'package:webspark_test_work/features/models/static_values.dart';

class HttpService {
  Future<Map<String, dynamic>> getResponseBody() async {
    Response response = await get(Uri.parse(Constants.url));
    return jsonDecode(response.body);
  }

  Future<int> postResponse(List<PostResponse> results) async {
    Response response = await post(
      Uri.parse(Constants.url),
      headers: {"Content-type": "application/json"},
      body: json.encode(List<dynamic>.from(results.map((x) => x.toJson()))),
    );

    return response.statusCode;
  }
}
