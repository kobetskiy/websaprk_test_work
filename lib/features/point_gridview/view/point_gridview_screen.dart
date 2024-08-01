import 'package:flutter/material.dart';
import 'package:webspark_test_work/features/models/constants.dart';
import 'package:webspark_test_work/features/models/point.dart';

class PointGridViewScreen extends StatelessWidget {
  const PointGridViewScreen({super.key, required this.mainIndex});

  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    final grid = Constants.gridList[mainIndex];
    return Scaffold(
      appBar: AppBar(title: const Text('Point GridView')),
      body: Column(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: grid.length,
            ),
            shrinkWrap: true,
            itemCount: grid.length * grid.length,
            itemBuilder: (context, index) {
              return PointGridView(index: index, mainIndex: mainIndex);
            },
          ),
          const Spacer(),
          const Text(
            'Point List:',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            Constants.resultList[mainIndex].result.path,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class PointGridView extends StatelessWidget {
  const PointGridView({
    super.key,
    required this.index,
    required this.mainIndex,
  });

  final int index;
  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    final point = _calculatePoint();
    final color = _getColor(point);

    return ColoredBox(
      color: color,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            '(${point.x},${point.y})',
            style: TextStyle(
              color: _textColor(color),
            ),
          ),
        ),
      ),
    );
  }

  PointModel _calculatePoint() {
    return PointModel(
      x: index % Constants.gridList[mainIndex].length,
      y: index ~/ Constants.gridList[mainIndex].length,
    );
  }

  Color _getColor(PointModel point) {
    final steps = Constants.resultList[mainIndex].result.steps;

    if (_isFirstStep(point, steps)) {
      return const Color(0xFF64FFDA);
    }
    if (_isLastStep(point, steps)) {
      return const Color(0xFF009688);
    }
    if (_isInSteps(point, steps)) {
      return const Color(0xFF4CAF50);
    }
    if (_isBlocked(point)) {
      return const Color(0xFF000000);
    }
    return const Color(0xFFFFFFFF);
  }

  bool _isFirstStep(PointModel point, List<PointModel> steps) {
    return steps.isNotEmpty &&
        steps.first.x == point.x &&
        steps.first.y == point.y;
  }

  bool _isLastStep(PointModel point, List<PointModel> steps) {
    return steps.isNotEmpty &&
        steps.last.x == point.x &&
        steps.last.y == point.y;
  }

  bool _isInSteps(PointModel point, List<PointModel> steps) {
    return steps.any((step) => step.x == point.x && step.y == point.y);
  }

  bool _isBlocked(PointModel point) {
    return Constants.gridList[mainIndex][point.y][point.x] == 'X';
  }

  Color _textColor(Color backgroundColor) {
    return backgroundColor == const Color(0xFF000000)
        ? Colors.white
        : Colors.black;
  }
}
