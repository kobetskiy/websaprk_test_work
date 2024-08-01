import 'package:flutter/material.dart';
import 'package:webspark_test_work/features/models/constants.dart';
import 'package:webspark_test_work/features/point_gridview/view/point_gridview_screen.dart';

class PointsListScreen extends StatefulWidget {
  const PointsListScreen({super.key});

  @override
  State<PointsListScreen> createState() => _PointsListScreenState();
}

class _PointsListScreenState extends State<PointsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Points List')),
      body: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Constants.navigateTo(
              context,
              PointGridViewScreen(mainIndex: index),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              Constants.resultList[index].result.path,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemCount: Constants.resultList.length,
      ),
    );
  }
}
