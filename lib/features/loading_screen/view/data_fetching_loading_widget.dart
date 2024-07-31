import 'dart:async';

import 'package:flutter/material.dart';

class DataFetchingLoadingWidget extends StatefulWidget {
  const DataFetchingLoadingWidget({super.key});

  @override
  State<DataFetchingLoadingWidget> createState() =>
      _DataFetchingLoadingWidgetState();
}

class _DataFetchingLoadingWidgetState extends State<DataFetchingLoadingWidget> {
  int percent = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer.cancel();
          percent = 100;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('Fetching data from the server...')),
        Center(child: Text('$percent%')),
        const SizedBox(height: 40),
        const CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          strokeWidth: 6,
          strokeAlign: 7,
        )
      ],
    );
  }
}