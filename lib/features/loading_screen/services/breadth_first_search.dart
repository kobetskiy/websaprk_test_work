import 'dart:collection';

import 'package:webspark_test_work/features/models/constants.dart';
import 'package:webspark_test_work/features/models/get_response.dart';
import 'package:webspark_test_work/features/models/point.dart';

class BreadthFirstSearch {
  List<String> getRoad(GetResponseDataModel responseData) {
    final start = _pointToString(responseData.start);
    final end = _pointToString(responseData.end);
    final grid = _parseGrid(responseData.field);

    Constants.gridList.add(grid);

    final gridMap = _mapNeighbours(grid);
    final searchedPath = _searchPath(gridMap, start, end);
    final roads = _constructRoads(searchedPath, gridMap);

    return _traceBackPath(start, end, roads);
  }

  String _pointToString(PointModel point) {
    return '${point.y},${point.x}';
  }

  List<List<String>> _parseGrid(List<String> field) {
    return field.map((row) => row.split('')).toList();
  }

  HashMap<String, List<String>> _mapNeighbours(List<List<String>> grid) {
    final HashMap<String, List<String>> gridMap = HashMap();

    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == '.') {
          gridMap['$i,$j'] = _findNeighbours(i, j, grid);
        }
      }
    }
    return gridMap;
  }

  List<String> _findNeighbours(int i, int j, List<List<String>> grid) {
    final List<String> neighbours = [];

    final directions = [
      [0, 1], [1, 0], [0, -1], [-1, 0],
      [-1, -1], [-1, 1], [1, -1], [1, 1]
    ];

    for (final direction in directions) {
      final int newX = i + direction[0];
      final int newY = j + direction[1];
      if (_isValid(newX, newY, grid)) {
        neighbours.add('$newX,$newY');
      }
    }

    return neighbours;
  }

  bool _isValid(int x, int y, List<List<String>> grid) {
    return x >= 0 && y >= 0 && x < grid.length && y < grid[x].length && grid[x][y] == '.';
  }

  List<String> _searchPath(HashMap<String, List<String>> gridMap, String start, String end) {
    if (start == end) return [start];

    final Queue<String> searchQueue = Queue.from(gridMap[start]!);
    final Set<String> searched = {start};

    while (searchQueue.isNotEmpty) {
      final current = searchQueue.removeFirst();
      if (!searched.contains(current)) {
        searched.add(current);
        if (current == end) return searched.toList();
        searchQueue.addAll(gridMap[current]!);
      }
    }
    return [];
  }

  List<List<String>> _constructRoads(List<String> searched, HashMap<String, List<String>> gridMap) {
    final List<List<String>> roads = [];

    for (final point in searched) {
      for (final neighbour in gridMap[point]!) {
        if (searched.contains(neighbour)) {
          roads.add([point, neighbour]);
        }
      }
    }
    return roads;
  }

  List<String> _traceBackPath(String start, String end, List<List<String>> roads) {
    final List<String> roadReverse = [end];
    String current = end;

    while (current != start) {
      for (final road in roads) {
        if (road[1] == current) {
          roadReverse.add(road[0]);
          current = road[0];
          break;
        }
      }
    }

    return roadReverse.reversed.toList();
  }
}
