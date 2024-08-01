import 'package:flutter/material.dart';

class DataFetchingFailureWidget extends StatelessWidget {
  const DataFetchingFailureWidget({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Text(error.toString());
  }
}
