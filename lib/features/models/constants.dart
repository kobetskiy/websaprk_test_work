import 'package:flutter/material.dart';

import 'post_response.dart';

class Constants {
  static String apiUrl = 'https://flutter.webspark.dev/flutter/api';
  static List<PostResponseModel> resultList = [];
  static List<List<List<String>>> gridList = [];
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
