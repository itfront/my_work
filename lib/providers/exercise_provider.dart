import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_work/models/exercise.dart';
import '../models/exercise.dart';

class ExerciseProvider with ChangeNotifier {
  final List<Exercise> _list = [];

  Future<List> get(String workoutId) async {
    List<Exercise> filtered = [];
    // ignore: avoid_function_literals_in_foreach_calls
    _list.forEach((element) {
      if (element.workoutId == workoutId) {
        filtered.add(element);
      }
    });
    return filtered;
  }

  Future<void> add(Exercise e) async {
    _list.add(e);

    notifyListeners();
  }

  Future<void> delete(String id) async {
    _list.removeWhere((element) => element.id == id);
  }
}
