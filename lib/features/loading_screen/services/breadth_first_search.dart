import 'dart:collection';

import 'package:webspark_test_work/features/models/get_response.dart';
import 'package:webspark_test_work/features/models/static_values.dart';

class BreadthFirstSearch {
  List<String> getRoad(GetResponseDataModel responseData) {
    String start = '${responseData.start.y},${responseData.start.x}';
    String end = '${responseData.end.y},${responseData.end.x}';
    List<List<String>> grid = _getGrid(responseData.field);
    Constants.grids.add(grid);
    HashMap<String, List<String>> gridMap = _findNeighbour(grid);
    List<String> searched = _search(gridMap, start, end);
    List<List<String>> roads = _getRoads(searched, gridMap);

    List<String> roadReverse = [end];
    String searchedValue = end;
    while (searchedValue != start) {
      for (List<String> road in roads) {
        if (road[1] == searchedValue) {
          roadReverse.add(road[0]);
          searchedValue = road[0];
          break;
        }
      }
    }

    return roadReverse.reversed.toList();
  }

  HashMap<String, List<String>> _findNeighbour(List<List<String>> grid) {
    HashMap<String, List<String>> gridMap = HashMap();
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == '.') {
          List<String> neighbours = [];

          if (i > 0 && grid[i - 1][j] == '.') {
            neighbours.add('${i - 1},$j');
          }
          if (i < grid.length - 1 && grid[i + 1][j] == '.') {
            neighbours.add('${i + 1},$j');
          }
          if (j > 0 && grid[i][j - 1] == '.') {
            neighbours.add('$i,${j - 1}');
          }
          if (j < grid[i].length - 1 && grid[i][j + 1] == '.') {
            neighbours.add('$i,${j + 1}');
          }
          if (i > 0 && j > 0 && grid[i - 1][j - 1] == '.') {
            neighbours.add('${i - 1},${j - 1}');
          }
          if (i > 0 && j < grid[i].length - 1 && grid[i - 1][j + 1] == '.') {
            neighbours.add('${i - 1},${j + 1}');
          }
          if (i < grid.length - 1 && j > 0 && grid[i + 1][j - 1] == '.') {
            neighbours.add('${i + 1},${j - 1}');
          }
          if (i < grid.length - 1 &&
              j < grid[i].length - 1 &&
              grid[i + 1][j + 1] == '.') {
            neighbours.add('${i + 1},${j + 1}');
          }
          gridMap["$i,$j"] = neighbours;
        }
      }
    }
    return gridMap;
  }

  List<String> _search(
      HashMap<String, List<String>> gridMap, String start, String end) {
    if (start == end) return [start];
    Queue<String> searchQueue = Queue.from(gridMap[start]!);
    Set<String> searched = {start};

    while (searchQueue.isNotEmpty) {
      String current = searchQueue.removeFirst();
      if (!searched.contains(current)) {
        searched.add(current);
        if (current == end) return searched.toList();
        searchQueue.addAll(gridMap[current]!);
      }
    }
    return [];
  }

  List<List<String>> _getRoads(
      List<String> searched, HashMap<String, List<String>> gridMap) {
    List<List<String>> roads = [];

    for (String point in searched) {
      for (String neighbour in gridMap[point]!) {
        if (searched.contains(neighbour)) {
          roads.add([point, neighbour]);
        }
      }
    }
    return roads;
  }

  List<List<String>> _getGrid(List<String> field) {
    return field.map((row) => row.split('')).toList();
  }
}
