import 'package:flutter/material.dart';
import 'package:my_work/models/workout.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [];

  Future<List<Workout>> get() {
    return Future.delayed(Duration(seconds: 3), () => [..._workouts]);
  }

  void add(Workout w) {
    _workouts.add(w);
    notifyListeners();
  }
}
