import 'package:flutter/material.dart';
import 'package:my_work/models/workout.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [];

  List<Workout> get() {
    return [..._workouts];
  }

  void add(Workout w) {
    _workouts.add(w);
    notifyListeners();
  }
}
